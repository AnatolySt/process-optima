require 'rails_helper'

RSpec.describe PeopleController, type: :controller do
  let(:person) { create(:person) }
  let(:invalid_person) { create(:invalid_person) }

  describe 'GET #index' do
    let(:people) { create_list(:person, 2) }
    before { get :index }

    it 'populates an array of all people' do
      expect(assigns(:people)).to match_array(people)
    end

    it 'render index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: person.id } }

    it 'assigns requested person to @person' do
      expect(assigns(:person)).to eq person
    end

    it 'render the person view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'assigns a new Person to @person' do
      expect(assigns(:person)).to be_a_new Person
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves a person in database' do
        expect { post :create, params: { person: attributes_for(:person) } }.to change(Person, :count).by(1)
      end

      it 'redirects to show view' do
        post :create, params: { person: attributes_for(:person) }
        expect(response).to redirect_to person_path(assigns(:person))
      end
    end

    context 'with invalid attributes' do
      it 'does not save a person' do
        expect { post :create, params: { person: attributes_for(:invalid_person) } }.to_not change(Person, :count)
      end

      it 're-renders the new view' do
        post :create, params: { person: attributes_for(:invalid_person)}
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #edit' do
    before { get :edit, params: { id: person.id } }

    it 'assigns the requested person to @person' do
      expect(assigns(:person)).to eq person
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      it 'assigns the requested person to @person' do
        patch :update, params: { id: person.id, person: attributes_for(:person) }
        expect(assigns(:person)).to eq person
      end

      it 'updates the attributes' do
        patch :update, params: { id: person.id, person: { first_name: 'Анатолий', last_name: 'Ступин' } }
        person.reload
        expect(person.first_name).to eq 'Анатолий'
        expect(person.last_name).to eq 'Ступин'
      end

      it 'redirects to te updated person' do
        patch :update, params: { id: person.id, person: { first_name: 'Анатолий', last_name: 'Ступин' } }
        expect(response).to redirect_to person_path(assigns(:person))
      end
    end

    context 'with invalid attributes' do
      before { patch :update, params: { id: person.id, person: { first_name: nil, last_name: nil } } }

      it 'does not change the attributes' do
        expect(person.first_name).to eq person.first_name
        expect(person.last_name).to eq person.last_name
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:person) { create(:person) }

    it 'deletes person' do
      expect { delete :destroy, params: { id: person.id } }.to change(Person, :count).by(-1)
    end
  end

end