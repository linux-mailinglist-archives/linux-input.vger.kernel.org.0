Return-Path: <linux-input+bounces-83-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 207387EE69A
	for <lists+linux-input@lfdr.de>; Thu, 16 Nov 2023 19:20:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76FB5B20AF0
	for <lists+linux-input@lfdr.de>; Thu, 16 Nov 2023 18:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09B2B46536;
	Thu, 16 Nov 2023 18:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="elHhcI2m"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB906D4E
	for <linux-input@vger.kernel.org>; Thu, 16 Nov 2023 10:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700158825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W5mlpim9jcVUEdoHsiIKTmHBFlyP5301DOd2SWFWL9E=;
	b=elHhcI2m4drah3wQpcjaAT+ql/SMcpSZbA1elFkewGklsw5Pdg8bovK1iOa8M6wVySgMTl
	PHKouoK5OdKfuf6N6M8E/DUxnrAHMbttkGhNDtrTaH8qTYomskxzKxoJYyqTOVsWK6bElf
	uYYyamQNKuetr307LKSEttW8C+q7oyE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-GfqKk6m1OdSjgsjV9sBZrg-1; Thu, 16 Nov 2023 13:20:23 -0500
X-MC-Unique: GfqKk6m1OdSjgsjV9sBZrg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9e28d82339aso82579466b.2
        for <linux-input@vger.kernel.org>; Thu, 16 Nov 2023 10:20:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700158822; x=1700763622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W5mlpim9jcVUEdoHsiIKTmHBFlyP5301DOd2SWFWL9E=;
        b=S8rGEAUjc2Gws2YTfXCl1cUa/51P3wvrDZM3+adctYK2S793D/dRq4kQA0yRN72e8n
         VsCeUGYnhKBiJjanRlN1DHvSgIX255dPTP2TEjTHtDiIZ2fxx8gqlKluaFV+Aa41Y27E
         QxbAdkBl7idmrHVSaLyafpY5txngoXUe4JE8qVFbVaakNkM9F2f7TLX8kmtneeM5u2+P
         km9/vSuzmXPjRryoJ89t3wObsa8tMqJV42GpacmvByXaXDBENTyphZ9MO0vmeRY+oBu+
         PrPLjkaDQbFODPZapMZ2To1Q4Bi1wqnrdzwe1F+bB+by4laXBeeFPz5rF1g73yvb4Vg+
         K8rw==
X-Gm-Message-State: AOJu0Yyxl6puO708fUFHe7mFnA9viV81I6BSElc+d4xZ7t3GmxbyA9KC
	CKFHYDTaBQw4A1U3DgTypgpe4S/rug8EBlFFF3VuUPHAUWQJSXX9hBOqaaUgrLcvqRt6lh09A8d
	ybrD9Vtg5IqYbGT3MBFt8Bns=
X-Received: by 2002:a17:906:6815:b0:9d3:8d1e:ced with SMTP id k21-20020a170906681500b009d38d1e0cedmr12564229ejr.34.1700158822622;
        Thu, 16 Nov 2023 10:20:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqCJ6XD/Ix9osIh3OQgLECR/SM1Us/HvHhbnyPH71N30XXq9jdoU+52d28rjEZjRtcxiXtog==
X-Received: by 2002:a17:906:6815:b0:9d3:8d1e:ced with SMTP id k21-20020a170906681500b009d38d1e0cedmr12564219ejr.34.1700158822301;
        Thu, 16 Nov 2023 10:20:22 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id i23-20020a1709061cd700b009d23e00a90esm8703452ejh.24.2023.11.16.10.20.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 10:20:21 -0800 (PST)
Message-ID: <87f753c8-924c-411b-93fe-b21525e76ae2@redhat.com>
Date: Thu, 16 Nov 2023 19:20:20 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: xpad - add Lenovo Legion Go controllers
To: Brenton Simpson <appsforartists@google.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Erica Taylor <rickytaylor26@gmail.com>, Vicki Pfau <vi@endrift.com>,
 nate@yocom.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ismael Ferreras Morezuelas <swyterzone@gmail.com>,
 Cameron Gutman <aicommander@gmail.com>
References: <CAAL3-=88exVfuL1Y-kvPNbsU+d-UTfDLFViWVObFLtbC4xueeA@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAAL3-=88exVfuL1Y-kvPNbsU+d-UTfDLFViWVObFLtbC4xueeA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Brenton,

On 11/16/23 18:45, Brenton Simpson wrote:
> When the controllers are both attached (or detached), they appear as
> 0x17ef, 0x6182.  When only one is attached, they appear as
> 0x17ef, 0x6184.
> 
> 84 (mixed attachment) is already recognized as a gamepad by Linux.  This
> patch adds 82 (both attached/detached).
> 
> These controllers have many more buttons than is typical.  With this
> patch, here's what's functional when it presents as 82:
> 
> Recognized:
> 
> - X, Y, A, B
> - both analog sticks, including L3/R3
> - D-pad
> - menu and capture buttons
> - rumble
> 
> Not yet recognized:
> 
> - start, select
> - 4 rear paddle buttons (Y1, Y2, Y3, M3)
> - gyroscope
> 
> (There are also non-functional buttons when reporting as 84 that are
> out-of-scope for this patch.)
> 
> Signed-off-by: Brenton Simpson <appsforartists@google.com>
> ---
>  drivers/input/joystick/xpad.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index f5c21565bb3cec..ecfcea8740a009 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -127,6 +127,7 @@ static const struct xpad_device {
>   u8 mapping;
>   u8 xtype;
>  } xpad_device[] = {

It looks like your workflow of copy-pasting this into your
email client has turned the tabs in the patch into a single space
character.

This and possibly other issues (line-wrapping, wrong end-of-line type)
is why using git send-email is the preferred way to submit kernel
patches.

Maybe try using Brenton Simpson <appsforartists+kernel@google.com>

for both the author and signed-off-by fields and then use
git send-email ?

Regards,

Hans

p.s.

Might be best to send the next attempt just to me, until you've
figured out a working email setup. And then once we have things
working, re-submit to the right people ?





> + { 0x17ef, 0x6182, "Lenovo Legion Go Controller (unified)", 0, XTYPE_XBOX360 },
>   { 0x0079, 0x18d4, "GPD Win 2 X-Box Controller", 0, XTYPE_XBOX360 },
>   { 0x03eb, 0xff01, "Wooting One (Legacy)", 0, XTYPE_XBOX360 },
>   { 0x03eb, 0xff02, "Wooting Two (Legacy)", 0, XTYPE_XBOX360 },
> @@ -459,6 +460,7 @@ static const signed short xpad_btn_paddles[] = {
> 
>  static const struct usb_device_id xpad_table[] = {
>   { USB_INTERFACE_INFO('X', 'B', 0) }, /* Xbox USB-IF not-approved class */
> + XPAD_XBOX360_VENDOR(0x17ef), /* Lenovo */
>   XPAD_XBOX360_VENDOR(0x0079), /* GPD Win 2 controller */
>   XPAD_XBOX360_VENDOR(0x03eb), /* Wooting Keyboards (Legacy) */
>   XPAD_XBOXONE_VENDOR(0x03f0), /* HP HyperX Xbox One controllers */
> 


