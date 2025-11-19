fix:
	dart fix --apply

get: 
	flutter pub get


b:	
	dart run build_runner build --delete-conflicting-outputs
