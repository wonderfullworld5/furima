# RSpec.describe "Item Purchases", type: :request do
#   let(:user) { FactoryBot.create(:user) }
#   let(:item) { FactoryBot.create(:item) }
#   let(:params) do
#     { purchase_form: { postcode: '123-4567', phone: '09012345678', city: 'City', street: 'Street' } }
#   end
#   let(:invalid_params) do
#     { purchase_form: { postcode: '', phone: '', city: '', street: '' } }
#   end

#   describe "GET /items/:id/purchase" do
#     context "as a logged-in user" do
#       before do
#         sign_in user
#       end

#       it "responds successfully" do
#         get purchase_item_path(item)
#         expect(response).to have_http_status(200)
#       end

#       it "redirects to the home page when trying to purchase own item" do
#         own_item = FactoryBot.create(:item, user: user)
#         get purchase_item_path(own_item)
#         expect(response).to redirect_to(root_path)
#       end
#     end

#     context "as a guest" do
#       it "redirects to the sign-in page" do
#         get purchase_item_path(item)
#         expect(response).to redirect_to(new_user_session_path)
#       end
#     end
#   end

#   describe "POST /items/:id/purchase" do
#     before do
#       sign_in user
#     end

#     context "with valid parameters" do
#       it "completes the purchase" do
#         expect {
#           post purchase_item_path(item), params: params
#         }.to change(Record, :count).by(1)

#         expect(response).to redirect_to(root_path)
#       end
#     end

#     context "with invalid parameters" do
#       it "does not complete the purchase" do
#         expect {
#           post purchase_item_path(item), params: invalid_params
#         }.not_to change(Record, :count)

#         expect(response).to render_template(:index)
#         expect(flash[:alert]).to be_present
#       end
#     end
#   end
# end
