require 'rails_helper'

RSpec.describe "/companies", type: :request do

  let(:valid_attributes) {
    attributes_for(:company)
  }

  let(:invalid_attributes) {
    attributes_for(:company, name: nil)
  }

  describe "GET /index" do
    let(:companies) { create_list(:company, 10) }

    it "renders a successful response" do
      get companies_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    let(:company) { create(:company) }

    it "renders a successful response" do
      get company_url(company)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_company_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    let(:company) { create(:company) }

    it "renders a successful response" do
      get edit_company_url(company)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Company" do
        expect {
          post companies_url, params: { company: valid_attributes }
        }.to change(Company, :count).by(1)
      end

      it "redirects to the created company" do
        post companies_url, params: { company: valid_attributes }
        expect(response).to redirect_to(company_url(Company.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Company" do
        expect {
          post companies_url, params: { company: invalid_attributes }
        }.to change(Company, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post companies_url, params: { company: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:company) { create(:company) }

      let(:new_attributes) {
        attributes_for(:company)
      }

      it "updates the requested company" do
        patch company_url(company), params: { company: new_attributes }
        company.reload
        expect(company.name).to eq(new_attributes[:name])
      end

      it "redirects to the company" do
        patch company_url(company), params: { company: new_attributes }
        company.reload
        expect(response).to redirect_to(company_url(company))
      end
    end

    context "with invalid parameters" do
      let(:company) { create(:company) }

      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        patch company_url(company), params: { company: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested company" do
      company = create(:company)
      expect {
        delete company_url(company)
      }.to change(Company, :count).by(-1)
    end

    it "redirects to the companies list" do
      company = create(:company)

      delete company_url(company)
      expect(response).to redirect_to(companies_url)
    end
  end
end
