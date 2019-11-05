# README

### Assumptions :

1. Simple user signin: 1 email corresponds to 1 company/vendor/hotelier
2. Softwares are subscribed to individually instead of suites

### Missing points :
1. User can create multiple hoteliers/vendors
2. Delete softwares
3. Search
4. Multiple additions of softwares at the same time for hotelier
5. Image upload for logos

### Usage

- Log in as default hotelier/vendor using the email `hotelier@hotelhero.tech` &`vendor@hotelhero.tech`
- Default password is "password"

### API

- Get all softwares by a vendor:

```javascript
{
	id: <vendor_id>
}
```

- Create a new software

```javascript
{
	"software": {
		"name": "Awesome HR software",
		"category": "Human Resource",
		"version": "1.0.0",
		"vendor_id": 13,
		"logo_url": "https://pigment.github.io/fake-logos/logos/medium/color/12.png"
	}
}
```
