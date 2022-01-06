Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D3D2486674
	for <lists+linux-input@lfdr.de>; Thu,  6 Jan 2022 16:04:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240274AbiAFPEB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Jan 2022 10:04:01 -0500
Received: from mail.valdk.tel ([185.177.150.13]:36854 "EHLO mail.valdk.tel"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240267AbiAFPEB (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 6 Jan 2022 10:04:01 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 928AE2E0B9D;
        Thu,  6 Jan 2022 18:03:52 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valdikss.org.ru;
        s=msrv; t=1641481435;
        h=from:subject:date:message-id:to:cc:mime-version:content-type:
         content-language:in-reply-to:references;
        bh=jgVtGL+u8w/VUfBfQqu8KKoHRrnFMRoItHaBmW7hF/Y=;
        b=bK2kOn5ryyPN61Ximq6f/NG3paxPH5BJcsnKWoiJTRYRb3entFlkqTJajA8VHwhcuIlMTa
        +3tN8n8mo0IN+LGqlOZxRCDbacvS2GwCsXZtK6Ztn9BxNxPS97AT1TBMnFHom3iiugZ4zh
        d/g/6RfKZOCY8jvEpFdLOFL2AsoXEzSKt9nzWNQqkuqC6GSIY3YDzaLtaaSeP8krtvSEEZ
        GptPS50yefn0yZ5k8BfDmeQumWe6st5Cw7QjmsSWTU3Pbs/YsYTlTZa9HjCXN7BJfY7ZDE
        WjbDtYdCVD1O2Edcq52hKmrE4kL47peUB09S8yQ8YUsvN3lUPbeKM7olen9p5Q==
Message-ID: <e9e1f6ce-f12c-291b-81a8-c76f72ee29f2@valdikss.org.ru>
Date:   Thu, 6 Jan 2022 18:03:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.5.0) Gecko/20100101,
 Thunderbird/78.5.0
Subject: Re: [PATCH v2 0/3] HID: lenovo: ThinkPad TrackPoint Keyboard II
 support
Content-Language: en-US
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
References: <20211216224611.440397-1-iam@valdikss.org.ru>
 <nycvar.YFH.7.76.2201061419420.16505@cbobk.fhfr.pm>
From:   ValdikSS <iam@valdikss.org.ru>
In-Reply-To: <nycvar.YFH.7.76.2201061419420.16505@cbobk.fhfr.pm>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JNw0wf76m6L7r3gevhDok4cJ"
X-Last-TLS-Session-Version: TLSv1.3
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------JNw0wf76m6L7r3gevhDok4cJ
Content-Type: multipart/mixed; boundary="------------Wk34WYXMLMwx78KJ6T4poOu2";
 protected-headers="v1"
From: ValdikSS <iam@valdikss.org.ru>
To: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 linux-input@vger.kernel.org
Message-ID: <e9e1f6ce-f12c-291b-81a8-c76f72ee29f2@valdikss.org.ru>
Subject: Re: [PATCH v2 0/3] HID: lenovo: ThinkPad TrackPoint Keyboard II
 support
References: <20211216224611.440397-1-iam@valdikss.org.ru>
 <nycvar.YFH.7.76.2201061419420.16505@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2201061419420.16505@cbobk.fhfr.pm>

--------------Wk34WYXMLMwx78KJ6T4poOu2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMDEuMjAyMiAxNjoxOSwgSmlyaSBLb3NpbmEgd3JvdGU6DQo+IE9uIEZyaSwgMTcg
RGVjIDIwMjEsIFZhbGRpa1NTIHdyb3RlOg0KPiANCj4+IFRoaXMgcGF0Y2hzZXQgYWRkcyBz
dXBwb3J0IGZvciBMZW5vdm8gVGhpbmtQYWQgVHJhY2tQb2ludCBLZXlib2FyZCBJSSwNCj4+
IGluIGJvdGggVVNCIGFuZCBCbHVldG9vdGggbW9kZXMuDQo+Pg0KPj4gSXQgYnJpbmdzIGFk
ZGl0aW9uYWwgZnVuY3Rpb25hbCBrZXlzIG1hcHBpbmcsIG5hdGl2ZSB2ZXJ0aWNhbCBhbmQg
aG9yaXpvbnRhbA0KPj4gc2Nyb2xsaW5nLCB0cmFja3BvaW50IHNlbnNpdGl2aXR5IGNvbmZp
Z3VyYXRpb24gYW5kIEZuLUxvY2sgc3luYy4NCj4+DQo+PiBUaGVyZSBpcyBubyBjb2RlIGRp
ZmZlcmVuY2UgYmV0d2VlbiB0aGUgcHJldmlvdXMgcGF0Y2hzZXQsIG9ubHkgbWlub3INCj4+
IHBhdGNoIHN1YmplY3QgY2hhbmdlcyBhbmQgY29kZS9jb21tZW50cyBzcGxpdC4NCj4+DQo+
PiBWYWxkaWtTUyAoMyk6DQo+PiAgICBISUQ6IGxlbm92bzogQWRkIHN1cHBvcnQgZm9yIFRo
aW5rUGFkIFRyYWNrUG9pbnQgS2V5Ym9hcmQgSUkNCj4+ICAgIEhJRDogbGVub3ZvOiBTeW5j
IEZuLWxvY2sgc3RhdGUgb24gYnV0dG9uIHByZXNzIGZvciBDb21wYWN0IGFuZA0KPj4gICAg
ICBUcmFja1BvaW50IElJIGtleWJvYXJkcw0KPj4gICAgSElEOiBsZW5vdm86IEFkZCBub3Rl
IGFib3V0IGRpZmZlcmVudCByZXBvcnQgbnVtYmVycw0KPiANCj4gVGhhbmtzIGZvciB0aGUg
cGF0Y2hlcy4gQ291bGQgeW91IGhvd2V2ZXIsIHBsZWFzZSwgcmVzdWJtaXQgd2l0aCB5b3Vy
IHJlYWwNCj4gbmFtZSwgYXMgb3V0bGluZWQgaW4gRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N1
Ym1pdHRpbmctcGF0Y2hlcy5yc3QgPw0KPiANCg0KSSBwcmVmZXIgdG8gdXNlIG15IGludGVy
bmV0IGlkZW50aXR5IG9uIHRoZSBpbnRlcm5ldC4gSWYgdGhpcyBpcyBhIA0Kc3RyaWN0IGVu
Zm9yY2VtZW50LCBJIGRvbid0IG1pbmQgaWYgeW91IGFwcGx5IHRoZSBwYXRjaGVzIGZyb20g
eW91ciANCm5hbWUsIGFzIGEgSElEIGlucHV0IG1haW50YWluZXIsIGlmIHRoYXQncyBwb3Nz
aWJsZS4NCg==

--------------Wk34WYXMLMwx78KJ6T4poOu2--

--------------JNw0wf76m6L7r3gevhDok4cJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEMiogvXcpmS32v71gXNcgLu+I93IFAmHXBNUFAwAAAAAACgkQXNcgLu+I93Iz
EA/7BKYLAzC9IxkH9yaK1GpJBRZyiXbk2q1bBMC9sOiSsXZju6Wir/Z6IhbZ6CHMZe4PwI8g6FNp
MC0dKLU9/kkV0UNoQa/AAN/1X98kQi+bhTv9cZEK+pq0BKjwIGwAbnGAfrbZnZB+NRNJhUCZT6rb
pn54XKIyv6uFfMqYbjjWIDwb5sBCGNBRn6IG7NIyRJ3BcGqa8VNgZVCNXwrSmuSAm1xQYYMGW0tf
gn8j+JAJZy1JZjOxkx1nY08G0TIuiWZ1pG7HURVN6kHBwvmp0l5ppRja72WjFjcQTP7IOTxAkO76
H7tnb5D6sqmZF/LA4iuxL2L9p79yLwtkVfIN1y5pqv6e8JbUDkZlkRTT2cb0qM/upDM2FwGuPasX
RTF3FGCqzkX1TYuHpM42zJ/kdSMMs9ujhGqTXVFPKPgMJBVoTHtlTcgV/q0/5PlNcJ+emqpvo+fU
X6slqnS113auvdHUD+hkDruQFmqL8qSkHfCrIRH3jNQ06ieGOooej5h5tXObUBiPzlKJKqtM7Y5g
5SuPuyRU0rvJQOgpkA9czBHOhgpZu7oNjIgemmDKbBkJoFO++It+Dwh/wcPUJ2JJHVwBQH1p6K4H
cr4uI0Zp7nUN6PZJ2dryOC9b6yIeMT5w5qst/KgDNfteG2x9rwlt23nyMAki457p4LNR3oJXBrKw
Q+A=
=zaQO
-----END PGP SIGNATURE-----

--------------JNw0wf76m6L7r3gevhDok4cJ--
