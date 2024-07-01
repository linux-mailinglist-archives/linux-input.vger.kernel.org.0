Return-Path: <linux-input+bounces-4791-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5341191EB38
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2024 00:57:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06760283573
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 22:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C01E5172BA2;
	Mon,  1 Jul 2024 22:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RTr7XxZg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657FC86131;
	Mon,  1 Jul 2024 22:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719874658; cv=none; b=DM3zKX/RpKHDuyJh5YoD7WAFIR4B7iP6V1F/x2wOdHwLve/sNylKMGmXjFC48PvfMg9zMySuzYdwC08Mw3XlcINJIaY3EjMY/sphJ05OZfsCeR1iPZAFEUwoehFq5VG3RQrJRekmUgtseby0CSZvNpzfau31S76XoBv206Cwr38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719874658; c=relaxed/simple;
	bh=OYbjhP7CkCOonziA7g0NRo92ftsaT1/kytGk+6tnXA8=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=gC3vGkj6pJUPvGeP4xJz49tYkdnN8atxS4PwEmMqkffP/KkAQN9gPfcLhTFWvs1yrIWHHyOp+kD3f5fUyFA+qnURw6/TrjN65hnWS+fF7qWZmZIPZYHM3XPj1Ev8YTKrelhTlVYBg/2jGKOQqI8gehJhcixi8MT/eCqmDpqp7hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RTr7XxZg; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1f9b52ef481so17224765ad.1;
        Mon, 01 Jul 2024 15:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719874657; x=1720479457; darn=vger.kernel.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B84hHIplLekMtjKp6DtChi8X3IzeUgBmzMCAhliJfCY=;
        b=RTr7XxZgO2WI5tvJ+7chdvwD1AsIbnVOzvIyy60+2G64aQ2TE1Lcb5oTbD1ijC7z4u
         2fP8u0c7hEPYojkPM4X5+OZOeP6uFrkbjguaF8LsX0sjBTL+D7SyJv+di+D2fe1rXauZ
         K0JM3D9r2JBNdNY78kRtg6A3oLnuOvU2BLb4mjNCR26p4gQ7l7tpjTb9BIHvdr+P8JTM
         us/Nh1/CLSS8tZPcnDW59w8VuOKAvP9QV6UZv1GaMqL/O+QysWCKU5K8+89I4RFSHRgW
         bmgkwlMjdcs0l3sdLqA88DskMPa//kI3AXejkW9fLpQ25JiIzlpJB2GQSnYPhqHWe75J
         Nafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719874657; x=1720479457;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B84hHIplLekMtjKp6DtChi8X3IzeUgBmzMCAhliJfCY=;
        b=ShcfZ1HXtuAAGZFfpbOwwxvuHeMCjwWlGT0HcPvNr+8MdeKSKHL5cvq7CuytabHvrb
         9Bu2o1iAyM0fUGCkj+dOUcf7JlymP3yJGdMJRsan47Opg/MX93Cdt5YIoa1xxny3Hboe
         9WHgtlDhKiyowb2F5C/g6k8vOLAVIFWVgRQt2LkjdhxTVSC51wNhvMMDB7eLx6UXz0cd
         Gb3uitl3bTW26ASlV8m/NeQQXizEVfwmAqsD8eYRDDnBQMmR0irLmWBb/1TywFS/5SP6
         2fyEGMNvYsqHAJNIthQF7to7SdA9MPGpFYLJDIkUXdTYKRm5X6xy7pJnRgNpi0nNr24C
         +2hA==
X-Forwarded-Encrypted: i=1; AJvYcCWJgrzg++DTFisuqvmtQ36/tetnkur7aBGGVDjptkDCy0W5FognuP5duNCgeFJUOg+79xTScpR54t4FeXnLzb7Pfs1cCgK8EoIK4pgJDoXbzgmZFOvb51nXU/g2DhXG2G9Em6O8zNWkoI0=
X-Gm-Message-State: AOJu0YwbXmI/6SKZOoWBxHLOQXWgxeRo5AqAUF7gZuEMdLc30M0jLFCT
	CI6v2L7bgUUzq107QwRYgpC+ZY4I//tsz9s/Zc4yyKoTit7SpcOu
X-Google-Smtp-Source: AGHT+IHYiqDWBfkCuFgipBOEgmrxbnv2Dg8mEsKsHwtpk5YgWUs0WvC+PFINOsgeDzoU9YQw/M6ylQ==
X-Received: by 2002:a17:903:22ce:b0:1fa:ab4a:faf7 with SMTP id d9443c01a7336-1fadbc73c52mr36583485ad.11.1719874656532;
        Mon, 01 Jul 2024 15:57:36 -0700 (PDT)
Received: from smtpclient.apple (121-45-106-167.tpgi.com.au. [121.45.106.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac156957fsm70702105ad.228.2024.07.01.15.57.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 15:57:36 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Orlando Chamberlain <orlandoch.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] HID: apple: Add support for magic keyboard backlight on T2 Macs
Date: Tue, 2 Jul 2024 08:57:23 +1000
Message-Id: <B28CFBDD-16ED-41AE-AE4A-92066D0DD4D8@gmail.com>
References: <8DC4D384-1349-4C8A-848D-589BA25B15D2@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, bentiss@kernel.org,
 linux-input@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
In-Reply-To: <8DC4D384-1349-4C8A-848D-589BA25B15D2@gmail.com>
To: Aditya Garg <gargaditya08@live.com>
X-Mailer: iPhone Mail (21F90)



> On 2 Jul 2024, at 8:48=E2=80=AFAM, Orlando Chamberlain <orlandoch.dev@gmai=
l.com> wrote:
>=20
>> On 2 Jul 2024, at 4:19=E2=80=AFAM, Aditya Garg <gargaditya08@live.com> wr=
ote:
>> =EF=BB=BFApparently this patch is breaking touchbar functionality is some=
 cases.
>=20
> I think this is because apple_magic_backlight_init will return an error wh=
en it finds the touchbar interface, but this return value is not checked, so=
 hid-apple still binds to the touchbar backlight.

We may also need to make sure hid_hw_stop is called in this case. Perhaps we=
 can move this logic from apple_magic_backlight_init to apple_probe?

>=20
> This should be fixable so I don't think we need to still have the separate=
 driver.
>=20
>>>=20
>>> static int apple_probe(struct hid_device *hdev,
>>>      const struct hid_device_id *id)
>>> {
>>> @@ -860,6 +940,9 @@ static int apple_probe(struct hid_device *hdev,
>>>  if (quirks & APPLE_BACKLIGHT_CTL)
>>>      apple_backlight_init(hdev);
>>>=20
>>> +    if (quirks & APPLE_MAGIC_BACKLIGHT)
>>> +        apple_magic_backlight_init(hdev);
>=20
> return value isn't checked here ^, we return 0 unconditionally below.
>=20
>>> +
>>>  return 0;
>>> }

