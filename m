Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 097A52C4132
	for <lists+linux-input@lfdr.de>; Wed, 25 Nov 2020 14:35:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729441AbgKYNe6 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Wed, 25 Nov 2020 08:34:58 -0500
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151]:20223 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726361AbgKYNe6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Nov 2020 08:34:58 -0500
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-230-16Z1kSBhOmOGKjtenUFg5Q-1; Wed, 25 Nov 2020 13:34:54 +0000
X-MC-Unique: 16Z1kSBhOmOGKjtenUFg5Q-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Wed, 25 Nov 2020 13:34:53 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Wed, 25 Nov 2020 13:34:53 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Jiri Kosina' <jikos@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
CC:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Subject: RE: [PATCH 063/141] HID: input: Fix fall-through warnings for Clang
Thread-Topic: [PATCH 063/141] HID: input: Fix fall-through warnings for Clang
Thread-Index: AQHWwyu7krTTi6wp3EytPBUHLpnbG6nY2HbA
Date:   Wed, 25 Nov 2020 13:34:53 +0000
Message-ID: <93bac7a8ac704a248b4f9877391e4a4f@AcuMS.aculab.com>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <18a24381b4461ec8174211c78eac549808b15e6f.1605896059.git.gustavoars@kernel.org>
 <nycvar.YFH.7.76.2011251403390.3441@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2011251403390.3441@cbobk.fhfr.pm>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Jiri Kosina <jikos@kernel.org>
> Sent: 25 November 2020 13:04
> On Fri, 20 Nov 2020, Gustavo A. R. Silva wrote:
> 
> > In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
> > by explicitly adding a goto statement instead of letting the code fall
> > through to the next case.
> >
> > Link: https://github.com/KSPP/linux/issues/115
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> > ---
> >  drivers/hid/hid-input.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> > index 9770db624bfa..37601b800a2e 100644
> > --- a/drivers/hid/hid-input.c
> > +++ b/drivers/hid/hid-input.c
> > @@ -743,6 +743,7 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
> >  				field->flags |= HID_MAIN_ITEM_RELATIVE;
> >  				break;
> >  			}
> > +			goto unknown;
> >
> >  		default: goto unknown;
> 
> This makes my eyes hurt :) But adding the annotation would be ugly as
> well, so let me just take it as-is.

                case HID_GD_RFKILL_BTN:
                        /* MS wireless radio ctl extension, also check CA */
                        if (field->application == HID_GD_WIRELESS_RADIO_CTLS) {
                                map_key_clear(KEY_RFKILL);
                                /* We need to simulate the btn release */
                                field->flags |= HID_MAIN_ITEM_RELATIVE;
                                break;
                        }

It might be best to invert the condition and de-indent the code.
                case HID_GD_RFKILL_BTN:
                        /* MS wireless radio ctl extension, also check CA */
                        if (field->application != HID_GD_WIRELESS_RADIO_CTLS)
                                goto unknown;
                        map_key_clear(KEY_RFKILL);
                        /* We need to simulate the btn release */
                        field->flags |= HID_MAIN_ITEM_RELATIVE;
                        break;

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

