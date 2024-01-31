Return-Path: <linux-input+bounces-1588-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 078BB8447F9
	for <lists+linux-input@lfdr.de>; Wed, 31 Jan 2024 20:27:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86F9F1F2597F
	for <lists+linux-input@lfdr.de>; Wed, 31 Jan 2024 19:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5535E3A8FE;
	Wed, 31 Jan 2024 19:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZKd6PVM8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F009539863
	for <linux-input@vger.kernel.org>; Wed, 31 Jan 2024 19:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706729254; cv=none; b=ooUEgbjELQntoJV1M1Wwc9QL3+jJf4CtacNmMh2kF7aRMZEGA9woqJfFbFxNLIYWilX+SZg3+AZ1t/DOrOGNnOnK3CKf2FEUx9h2VFJqlPZNh1p2xD0xnVcaSMkOPEB4ztfdHIrl7yXdQVnjE9MvVQQY1aNRK9YVvKvVfHW1ZUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706729254; c=relaxed/simple;
	bh=yzP3OUNxdiEtFPkuW+hTF4OH/g6vF9LKk4MGcCDpo7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iHL3YCz5ytJQGvt1+ht3AkHCam65vnTJtOCOae+i0YvVhf3yM56Nt0L2jbiiUZ1owK03lA5zwHjqijZXsmK54vAoNOAfypqWTL5f41qoNBk/mmcd+2S0ZSK4IvWUgpw3MntjC3VaO377dIaXspRfbGLYYm/FC8jioqDjB3RfQTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZKd6PVM8; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a26ed1e05c7so11218466b.2
        for <linux-input@vger.kernel.org>; Wed, 31 Jan 2024 11:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706729250; x=1707334050; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+sgOUch6dqnrAVxfbI7l+0Bbi4TUiKgTJogPg+drR5M=;
        b=ZKd6PVM8hAgo3cLEcltKHwnUOZBtBy+0Wxg66ag3tt8kLYFGkIo7X+yBgKpfoqbY+s
         HbJ9iKrc+xKHMLnCA0S8VHeAnFQC7xwlsKW4kNn427SfKfFU2cUqjI/0SkyWBZHqArr/
         GhGONM/T7vphRzy2dFwm7s8915Jv1zb2WOm1yxhHriIOwlIMxNt2TK2ofFuXiSHxr/qL
         BeqX/LuXhEcm6Lj95cwYPwBxAQI7iZPpGI0l19MVkm6bDVDjQlvJXY2bZrlHwhhrVU9t
         FFg939WT4TLUICElWD+kfsyX8JqCPvULfDgnBZnxAgxHmuIR8UK3fdnYNRLRf5+MZ+NW
         xx3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706729250; x=1707334050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+sgOUch6dqnrAVxfbI7l+0Bbi4TUiKgTJogPg+drR5M=;
        b=BE+ToP/B5SZP6PazF01UAcU9560CKTUOTjNlsbElQepxkUrqcDiwlQ3c1KFD5YgPQT
         hYjkWAaaY/Xa2hiL6PxE1iTxBAIYHmYKb2CWy5YyTvCgqHOdmrocebX7CAMD2S1Z7Cs4
         gvRQwUhUlWURweKJ7Rcmgc1vebXJ25hxNHrFjYnMVxsxsATw7raoiOexAt499571dmxE
         vB2x9tOtxruNbg7+ZzHVE2RAybLyHR67690OicF06hcG0BNhuo75DdVHufPzu0E97yHb
         wcQRoDbmccgjCjsHoF+7jlm7tt7P9vPEO9+Bsocd3iLHBjEuOPrBI4cinaoA07xDq9Qq
         RVcw==
X-Gm-Message-State: AOJu0YyrqCpN2LWS5L9VwGwOn0S+JQP1Mh88ZtN7QmB2c2ZWzec1OpoE
	HkA2lsoqSFj2pB+KXYvbWaYZ6MwtC1hD95xPKpcnfRTMjv3wlhQl41GYtVwSTZPCn8YYDbskbVp
	+XmEsOsF7lHqGm+vUWe5AxC/KHK4=
X-Google-Smtp-Source: AGHT+IGGothUKLdmDEDmTRc2e1ZkjisUSM9O4C8AmYTNju7T0lsln1DD+3NCTezRcT1B7Mk36JfQXXXDykkd9NQgQoQ=
X-Received: by 2002:a17:906:4890:b0:a35:4a82:2046 with SMTP id
 v16-20020a170906489000b00a354a822046mr161807ejq.24.1706729249597; Wed, 31 Jan
 2024 11:27:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEQPD4S1zyUMUyJbOb8i5a+URsLCrGMKPKD47es8OgCoKKwRQg@mail.gmail.com>
 <CAEQPD4T+C_RaP_z96XRXj1teGiDMZu1MsPn8hAQ5FhSoaajZaA@mail.gmail.com>
 <CAEQPD4RSFJN5TvU2vwHL=w1TkMzxD+v1=jxyyNzZDMyPane=BQ@mail.gmail.com> <CAO-hwJ+OFxRqoL4RYaKMR_PfmpBJuyWUGcDXRrp7jWuYfT=CyQ@mail.gmail.com>
In-Reply-To: <CAO-hwJ+OFxRqoL4RYaKMR_PfmpBJuyWUGcDXRrp7jWuYfT=CyQ@mail.gmail.com>
From: Taco Jerkface <tacodog311@gmail.com>
Date: Wed, 31 Jan 2024 12:27:20 -0700
Message-ID: <CAEQPD4TNkGn-xjLqNiNb5c2Hc9P-4Hpeq-92tBSPJiJ=4-dsZw@mail.gmail.com>
Subject: Re: Suspected bug in hid-microsoft.c
To: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Siarhei Vishniakou <svv@google.com>, linux-input@vger.kernel.org, jikos@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the response!
I put some diagnostic info below, but please let me know if I can do
anything else to help.
Thank you.

hid-recorder does not see the controller when connected with USB.

sudo hid-recorder
Available devices:
/dev/hidraw0:   DLL07D1:01 044E:120B
Select the device event number [0-0]:


When connected with Bluetooth, hid-recorder sees the device as "Xbox
Wireless Controler" and the dump is below:

sudo hid-recorder
Available devices:
/dev/hidraw0:   DLL07D1:01 044E:120B
/dev/hidraw1:   Xbox Wireless Controller
Select the device event number [0-1]: 1
# Xbox Wireless Controller
# 0x05, 0x01,                    // Usage Page (Generic Desktop)        0
# 0x09, 0x05,                    // Usage (Game Pad)                    2
# 0xa1, 0x01,                    // Collection (Application)            4
# 0x85, 0x01,                    //  Report ID (1)                      6
# 0x09, 0x01,                    //  Usage (Pointer)                    8
# 0xa1, 0x00,                    //  Collection (Physical)              10
# 0x09, 0x30,                    //   Usage (X)                         12
# 0x09, 0x31,                    //   Usage (Y)                         14
# 0x15, 0x00,                    //   Logical Minimum (0)               16
# 0x27, 0xff, 0xff, 0x00, 0x00,  //   Logical Maximum (65535)           18
# 0x95, 0x02,                    //   Report Count (2)                  23
# 0x75, 0x10,                    //   Report Size (16)                  25
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              27
# 0xc0,                          //  End Collection                     29
# 0x09, 0x01,                    //  Usage (Pointer)                    30
# 0xa1, 0x00,                    //  Collection (Physical)              32
# 0x09, 0x32,                    //   Usage (Z)                         34
# 0x09, 0x35,                    //   Usage (Rz)                        36
# 0x15, 0x00,                    //   Logical Minimum (0)               38
# 0x27, 0xff, 0xff, 0x00, 0x00,  //   Logical Maximum (65535)           40
# 0x95, 0x02,                    //   Report Count (2)                  45
# 0x75, 0x10,                    //   Report Size (16)                  47
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              49
# 0xc0,                          //  End Collection                     51
# 0x05, 0x02,                    //  Usage Page (Simulation Controls)   52
# 0x09, 0xc5,                    //  Usage (Brake)                      54
# 0x15, 0x00,                    //  Logical Minimum (0)                56
# 0x26, 0xff, 0x03,              //  Logical Maximum (1023)             58
# 0x95, 0x01,                    //  Report Count (1)                   61
# 0x75, 0x0a,                    //  Report Size (10)                   63
# 0x81, 0x02,                    //  Input (Data,Var,Abs)               65
# 0x15, 0x00,                    //  Logical Minimum (0)                67
# 0x25, 0x00,                    //  Logical Maximum (0)                69
# 0x75, 0x06,                    //  Report Size (6)                    71
# 0x95, 0x01,                    //  Report Count (1)                   73
# 0x81, 0x03,                    //  Input (Cnst,Var,Abs)               75
# 0x05, 0x02,                    //  Usage Page (Simulation Controls)   77
# 0x09, 0xc4,                    //  Usage (Accelerator)                79
# 0x15, 0x00,                    //  Logical Minimum (0)                81
# 0x26, 0xff, 0x03,              //  Logical Maximum (1023)             83
# 0x95, 0x01,                    //  Report Count (1)                   86
# 0x75, 0x0a,                    //  Report Size (10)                   88
# 0x81, 0x02,                    //  Input (Data,Var,Abs)               90
# 0x15, 0x00,                    //  Logical Minimum (0)                92
# 0x25, 0x00,                    //  Logical Maximum (0)                94
# 0x75, 0x06,                    //  Report Size (6)                    96
# 0x95, 0x01,                    //  Report Count (1)                   98
# 0x81, 0x03,                    //  Input (Cnst,Var,Abs)               100
# 0x05, 0x01,                    //  Usage Page (Generic Desktop)       102
# 0x09, 0x39,                    //  Usage (Hat switch)                 104
# 0x15, 0x01,                    //  Logical Minimum (1)                106
# 0x25, 0x08,                    //  Logical Maximum (8)                108
# 0x35, 0x00,                    //  Physical Minimum (0)               110
# 0x46, 0x3b, 0x01,              //  Physical Maximum (315)             112
# 0x66, 0x14, 0x00,              //  Unit (EnglishRotation: deg)        115
# 0x75, 0x04,                    //  Report Size (4)                    118
# 0x95, 0x01,                    //  Report Count (1)                   120
# 0x81, 0x42,                    //  Input (Data,Var,Abs,Null)          122
# 0x75, 0x04,                    //  Report Size (4)                    124
# 0x95, 0x01,                    //  Report Count (1)                   126
# 0x15, 0x00,                    //  Logical Minimum (0)                128
# 0x25, 0x00,                    //  Logical Maximum (0)                130
# 0x35, 0x00,                    //  Physical Minimum (0)               132
# 0x45, 0x00,                    //  Physical Maximum (0)               134
# 0x65, 0x00,                    //  Unit (None)                        136
# 0x81, 0x03,                    //  Input (Cnst,Var,Abs)               138
# 0x05, 0x09,                    //  Usage Page (Button)                140
# 0x19, 0x01,                    //  Usage Minimum (1)                  142
# 0x29, 0x0f,                    //  Usage Maximum (15)                 144
# 0x15, 0x00,                    //  Logical Minimum (0)                146
# 0x25, 0x01,                    //  Logical Maximum (1)                148
# 0x75, 0x01,                    //  Report Size (1)                    150
# 0x95, 0x0f,                    //  Report Count (15)                  152
# 0x81, 0x02,                    //  Input (Data,Var,Abs)               154
# 0x15, 0x00,                    //  Logical Minimum (0)                156
# 0x25, 0x00,                    //  Logical Maximum (0)                158
# 0x75, 0x01,                    //  Report Size (1)                    160
# 0x95, 0x01,                    //  Report Count (1)                   162
# 0x81, 0x03,                    //  Input (Cnst,Var,Abs)               164
# 0x05, 0x0c,                    //  Usage Page (Consumer Devices)      166
# 0x0a, 0xb2, 0x00,              //  Usage (Record)                     168
# 0x15, 0x00,                    //  Logical Minimum (0)                171
# 0x25, 0x01,                    //  Logical Maximum (1)                173
# 0x95, 0x01,                    //  Report Count (1)                   175
# 0x75, 0x01,                    //  Report Size (1)                    177
# 0x81, 0x02,                    //  Input (Data,Var,Abs)               179
# 0x15, 0x00,                    //  Logical Minimum (0)                181
# 0x25, 0x00,                    //  Logical Maximum (0)                183
# 0x75, 0x07,                    //  Report Size (7)                    185
# 0x95, 0x01,                    //  Report Count (1)                   187
# 0x81, 0x03,                    //  Input (Cnst,Var,Abs)               189
# 0x05, 0x0c,                    //  Usage Page (Consumer Devices)      191
# 0x09, 0x01,                    //  Usage (Consumer Control)           193
# 0xa1, 0x01,                    //  Collection (Application)           195
# 0x0a, 0x85, 0x00,              //   Usage (Order Movie)               197
# 0x15, 0x00,                    //   Logical Minimum (0)               200
# 0x26, 0xff, 0x00,              //   Logical Maximum (255)             202
# 0x95, 0x01,                    //   Report Count (1)                  205
# 0x75, 0x08,                    //   Report Size (8)                   207
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              209
# 0x0a, 0x99, 0x00,              //   Usage (Media Select Security)     211
# 0x15, 0x00,                    //   Logical Minimum (0)               214
# 0x26, 0xff, 0x00,              //   Logical Maximum (255)             216
# 0x95, 0x01,                    //   Report Count (1)                  219
# 0x75, 0x04,                    //   Report Size (4)                   221
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              223
# 0x15, 0x00,                    //   Logical Minimum (0)               225
# 0x25, 0x00,                    //   Logical Maximum (0)               227
# 0x95, 0x01,                    //   Report Count (1)                  229
# 0x75, 0x04,                    //   Report Size (4)                   231
# 0x81, 0x03,                    //   Input (Cnst,Var,Abs)              233
# 0x0a, 0x81, 0x00,              //   Usage (Assign Selection)          235
# 0x15, 0x00,                    //   Logical Minimum (0)               238
# 0x26, 0xff, 0x00,              //   Logical Maximum (255)             240
# 0x95, 0x01,                    //   Report Count (1)                  243
# 0x75, 0x04,                    //   Report Size (4)                   245
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              247
# 0x15, 0x00,                    //   Logical Minimum (0)               249
# 0x25, 0x00,                    //   Logical Maximum (0)               251
# 0x95, 0x01,                    //   Report Count (1)                  253
# 0x75, 0x04,                    //   Report Size (4)                   255
# 0x81, 0x03,                    //   Input (Cnst,Var,Abs)              257
# 0xc0,                          //  End Collection                     259
# 0x05, 0x0f,                    //  Usage Page (Vendor Usage Page 0x0f) 26=
0
# 0x09, 0x21,                    //  Usage (Vendor Usage 0x21)          262
# 0x85, 0x03,                    //  Report ID (3)                      264
# 0xa1, 0x02,                    //  Collection (Logical)               266
# 0x09, 0x97,                    //   Usage (Vendor Usage 0x97)         268
# 0x15, 0x00,                    //   Logical Minimum (0)               270
# 0x25, 0x01,                    //   Logical Maximum (1)               272
# 0x75, 0x04,                    //   Report Size (4)                   274
# 0x95, 0x01,                    //   Report Count (1)                  276
# 0x91, 0x02,                    //   Output (Data,Var,Abs)             278
# 0x15, 0x00,                    //   Logical Minimum (0)               280
# 0x25, 0x00,                    //   Logical Maximum (0)               282
# 0x75, 0x04,                    //   Report Size (4)                   284
# 0x95, 0x01,                    //   Report Count (1)                  286
# 0x91, 0x03,                    //   Output (Cnst,Var,Abs)             288
# 0x09, 0x70,                    //   Usage (Vendor Usage 0x70)         290
# 0x15, 0x00,                    //   Logical Minimum (0)               292
# 0x25, 0x64,                    //   Logical Maximum (100)             294
# 0x75, 0x08,                    //   Report Size (8)                   296
# 0x95, 0x04,                    //   Report Count (4)                  298
# 0x91, 0x02,                    //   Output (Data,Var,Abs)             300
# 0x09, 0x50,                    //   Usage (Vendor Usage 0x50)         302
# 0x66, 0x01, 0x10,              //   Unit (SILinear: s)                304
# 0x55, 0x0e,                    //   Unit Exponent (-2)                307
# 0x15, 0x00,                    //   Logical Minimum (0)               309
# 0x26, 0xff, 0x00,              //   Logical Maximum (255)             311
# 0x75, 0x08,                    //   Report Size (8)                   314
# 0x95, 0x01,                    //   Report Count (1)                  316
# 0x91, 0x02,                    //   Output (Data,Var,Abs)             318
# 0x09, 0xa7,                    //   Usage (Vendor Usage 0xa7)         320
# 0x15, 0x00,                    //   Logical Minimum (0)               322
# 0x26, 0xff, 0x00,              //   Logical Maximum (255)             324
# 0x75, 0x08,                    //   Report Size (8)                   327
# 0x95, 0x01,                    //   Report Count (1)                  329
# 0x91, 0x02,                    //   Output (Data,Var,Abs)             331
# 0x65, 0x00,                    //   Unit (None)                       333
# 0x55, 0x00,                    //   Unit Exponent (0)                 335
# 0x09, 0x7c,                    //   Usage (Vendor Usage 0x7c)         337
# 0x15, 0x00,                    //   Logical Minimum (0)               339
# 0x26, 0xff, 0x00,              //   Logical Maximum (255)             341
# 0x75, 0x08,                    //   Report Size (8)                   344
# 0x95, 0x01,                    //   Report Count (1)                  346
# 0x91, 0x02,                    //   Output (Data,Var,Abs)             348
# 0xc0,                          //  End Collection                     350
# 0x05, 0x0c,                    //  Usage Page (Consumer Devices)      351
# 0x09, 0x01,                    //  Usage (Consumer Control)           353
# 0x85, 0x0c,                    //  Report ID (12)                     355
# 0xa1, 0x01,                    //  Collection (Application)           357
# 0x0a, 0x9e, 0x00,              //   Usage (Media Select SAP)          359
# 0x15, 0x00,                    //   Logical Minimum (0)               362
# 0x26, 0xff, 0x00,              //   Logical Maximum (255)             364
# 0x95, 0x01,                    //   Report Count (1)                  367
# 0x75, 0x08,                    //   Report Size (8)                   369
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              371
# 0x0a, 0xa1, 0x00,              //   Usage (Once)                      373
# 0x15, 0x00,                    //   Logical Minimum (0)               376
# 0x26, 0xff, 0x00,              //   Logical Maximum (255)             378
# 0x95, 0x01,                    //   Report Count (1)                  381
# 0x75, 0x08,                    //   Report Size (8)                   383
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              385
# 0x0a, 0xa2, 0x00,              //   Usage (Daily)                     387
# 0x15, 0x00,                    //   Logical Minimum (0)               390
# 0x26, 0xff, 0x00,              //   Logical Maximum (255)             392
# 0x95, 0x01,                    //   Report Count (1)                  395
# 0x75, 0x08,                    //   Report Size (8)                   397
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              399
# 0x0a, 0xa3, 0x00,              //   Usage (Weekly)                    401
# 0x15, 0x00,                    //   Logical Minimum (0)               404
# 0x26, 0xff, 0x00,              //   Logical Maximum (255)             406
# 0x95, 0x01,                    //   Report Count (1)                  409
# 0x75, 0x08,                    //   Report Size (8)                   411
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              413
# 0xc0,                          //  End Collection                     415
# 0xc0,                          // End Collection                      416
# 0x05, 0x01,                    // Usage Page (Generic Desktop)        417
# 0x09, 0x06,                    // Usage (Keyboard)                    419
# 0xa1, 0x01,                    // Collection (Application)            421
# 0x85, 0x05,                    //  Report ID (5)                      423
# 0x05, 0x07,                    //  Usage Page (Keyboard)              425
# 0x19, 0xe0,                    //  Usage Minimum (224)                427
# 0x29, 0xe7,                    //  Usage Maximum (231)                429
# 0x15, 0x00,                    //  Logical Minimum (0)                431
# 0x25, 0x01,                    //  Logical Maximum (1)                433
# 0x75, 0x01,                    //  Report Size (1)                    435
# 0x95, 0x08,                    //  Report Count (8)                   437
# 0x81, 0x02,                    //  Input (Data,Var,Abs)               439
# 0x95, 0x01,                    //  Report Count (1)                   441
# 0x75, 0x08,                    //  Report Size (8)                    443
# 0x81, 0x03,                    //  Input (Cnst,Var,Abs)               445
# 0x95, 0x06,                    //  Report Count (6)                   447
# 0x75, 0x08,                    //  Report Size (8)                    449
# 0x15, 0x00,                    //  Logical Minimum (0)                451
# 0x25, 0x65,                    //  Logical Maximum (101)              453
# 0x05, 0x07,                    //  Usage Page (Keyboard)              455
# 0x19, 0x00,                    //  Usage Minimum (0)                  457
# 0x29, 0x65,                    //  Usage Maximum (101)                459
# 0x81, 0x00,                    //  Input (Data,Arr,Abs)               461
# 0xc0,                          // End Collection                      463
#
R: 464 05 01 09 05 a1 01 85 01 09 01 a1 00 09 30 09 31 15 00 27 ff ff
00 00 95 02 75 10 81 02 c0 09 01 a1 00 09 32 09 35 15 00 27 ff ff 00
00 95 02 75 10 81 02 c0 05 02 09 c5 15 00 26 ff 03 95 01 75 0a
81 02 15 00 25 00 75 06 95 01 81 03 05 02 09 c4 15 00 26 ff 03 95 01
75 0a 81 02 15 00 25 00 75 06 95 01 81 03 05 01 09 39 15 01 25 08 35
00 46 3b 01 66 14 00 75 04 95 01 81 42 75 04 95 01 15 00 25 00
35 00 45 00 65 00 81 03 05 09 19 01 29 0f 15 00 25 01 75 01 95 0f 81
02 15 00 25 00 75 01 95 01 81 03 05 0c 0a b2 00 15 00 25 01 95 01 75
01 81 02 15 00 25 00 75 07 95 01 81 03 05 0c 09 01 a1 01 0a 85
00 15 00 26 ff 00 95 01 75 08 81 02 0a 99 00 15 00 26 ff 00 95 01 75
04 81 02 15 00 25 00 95 01 75 04 81 03 0a 81 00 15 00 26 ff 00 95 01
75 04 81 02 15 00 25 00 95 01 75 04 81 03 c0 05 0f 09 21 85 03
a1 02 09 97 15 00 25 01 75 04 95 01 91 02 15 00 25 00 75 04 95 01 91
03 09 70 15 00 25 64 75 08 95 04 91 02 09 50 66 01 10 55 0e 15 00 26
ff 00 75 08 95 01 91 02 09 a7 15 00 26 ff 00 75 08 95 01 91 02
65 00 55 00 09 7c 15 00 26 ff 00 75 08 95 01 91 02 c0 05 0c 09 01 85
0c a1 01 0a 9e 00 15 00 26 ff 00 95 01 75 08 81 02 0a a1 00 15 00 26
ff 00 95 01 75 08 81 02 0a a2 00 15 00 26 ff 00 95 01 75 08 81
02 0a a3 00 15 00 26 ff 00 95 01 75 08 81 02 c0 c0 05 01 09 06 a1 01
85 05 05 07 19 e0 29 e7 15 00 25 01 75 01 95 08 81 02 95 01 75 08 81
03 95 06 75 08 15 00 25 65 05 07 19 00 29 65 81 00 c0
N: Xbox Wireless Controller
I: 5 045e 0b22

On Wed, Jan 31, 2024 at 2:57=E2=80=AFAM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> Hi,
>
> [Adding Siarhei who added support for those controllers in the kernel]
>
> On Wed, Jan 31, 2024 at 7:27=E2=80=AFAM Taco Jerkface <tacodog311@gmail.c=
om> wrote:
> >
> > Resending without HTML:
> >
> > Hi,
> >
> > I hope this is the correct contact for this report, I found you as the
> > maintainer in the hid-microsoft.c.
> >
> > I believe there is a bug in the microsoft bluetooth driver for the
> > Xbox Elite Series 2 controller.  I have been experiencing issues with
> > it that I initially thought were SDL related.  However the SDL team
> > seems to think this is driver related. My SDL bug report information
> > is here:
> >
> > https://github.com/libsdl-org/SDL/issues/8907
>
> Hard to say anything with that bug report because we don't know what
> those tools are supposed to do, and how they access the device (hidraw
> or evdev).
>
> Note that the bluetooth version is using uhid because it's a BLE controll=
er.
> Basically when there is a BLE controller, bluez handles the transport
> layer from userspace, and injects the events through uhid so that it's
> handled as a normal kernel device.
>
> So there is no "uhid userspace driver", bluez just blindly forwards
> the events/reports/commands as it is told.
>
> >
> > Basically, SDL reads the controller correctly when connected by USB,
> > and if I run "controllermap" with root permission, but with user
> > permissions it misreads
>
> Using root or not shouldn't change the way your program sees the
> device: if you are capable of opening it, then you should get the same
> output.
>
> However, the immediate explanation that would come to my mind is that
> you are not using the "same" controller in both cases:
> - maybe that when you use it with root you are talking to the device
> through hidraw
> - maybe when you are not root you are talking to the device through evdev
>
> Again, not knowing the tools doesn't help me here :(
>
> >  the number of buttons as 122, the first paddle
> > button on the back seems to act like the "screenshot" button from the
> > 1914 controller, and the other paddle buttons are not read.  All
> > buttons read fine with evites, but the paddle buttons "KEY_UNKNOWN"
> >
> > type 1 (EV_KEY), code 240 (KEY_UNKNOWN), value 0
> >
> > Please let me know if there is a better contact for this, or if there
> > is anything I can do to help identify the problem.
> >
>
> Ideally I'd like Siarhei to answer here. But in the meantime, we could
> fetch some logs from the device itself which would allow me to better
> understand the issue:
> please use hid-recorder from hid-tools[1] to get the logs, and attach
> the whole output, with a recording of the events that are problematic:
> $> pip3 install hid-tools
> $> sudo hid-recorder
>
> Please dump 2 hid-recorder outputs, one with USB, and one with
> Bluetooth, with the same event sequence if possible so we can compare
> between the 2.
>
> Cheers,
> Benjamin
>
> [1] https://gitlab.freedesktop.org/libevdev/hid-tools
>

