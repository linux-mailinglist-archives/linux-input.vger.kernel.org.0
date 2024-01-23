Return-Path: <linux-input+bounces-1406-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3283B8390E1
	for <lists+linux-input@lfdr.de>; Tue, 23 Jan 2024 15:10:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF8E628E55C
	for <lists+linux-input@lfdr.de>; Tue, 23 Jan 2024 14:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D5745FDD7;
	Tue, 23 Jan 2024 14:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FKFcGwzi"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89FE5FDC8
	for <linux-input@vger.kernel.org>; Tue, 23 Jan 2024 14:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706018985; cv=none; b=HYY9u7DsxBPzow+nNYp3EEeaJ/icfLXVXS0s/07NwVq6Ods9A7sjSRLfEs7xF9+Ji4dozZj/eCz/++Rx1xOu9ekXpAMiEllnfrnc/LKQ19tz4LXWaTqU8wLHuPW4xRSippWRsmJdoEw6lXBhdqETmECJIab8mcOUlp6oVCGshV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706018985; c=relaxed/simple;
	bh=064xOmOrJ0T2SStHyWZYF/9HZ77x3LaFKSC/TzbF4eo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=eFgBXhngpzAr0nYgVPUmvIkjlU+Wb5HTVxERy/XEffYWZzs7rueCV6Fl0rTEBwqI6/aKx0UwyDxRhx4XioFlroRkm/QnkV5Kdyl+JmmwCgj8rXPwTWSAZ/a3pEckMBzVCE8BUFSFUBlDaPJr58EfEGORSWyWudJF7FiPGzgK4q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FKFcGwzi; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5100c4aa08cso310754e87.2
        for <linux-input@vger.kernel.org>; Tue, 23 Jan 2024 06:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706018981; x=1706623781; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=064xOmOrJ0T2SStHyWZYF/9HZ77x3LaFKSC/TzbF4eo=;
        b=FKFcGwzimb9ZHsADscueBT0SFAr2b9nm4ZbqPoS0hwm9IGjDdi1dB53XPLai8Iu76h
         YwaV1klMekZFCD6VMh0gaQ5ubNxAV4+1nLhhMeTalnsYSypai4uVF2htX//zdxpZjkAj
         5OX15LryAjsjBfivvNINd1FHB+eQMl181zLzC4SVxQPE28vuLzXWPnNhMFa90QFTaag5
         V/WcZTW/otYymWag1z810eInl+6LwmKIYwqW0Tar/1SI2w628oAmFeQAj8C1vcj1OdKd
         MG25oysMocIA8hv2SdII1MHiOPCRlF8CSAPXhsBhRyR9izQ69G319sdpGQ0InmMQDFzD
         x3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706018981; x=1706623781;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=064xOmOrJ0T2SStHyWZYF/9HZ77x3LaFKSC/TzbF4eo=;
        b=az37Cukeqt8HWyk7pd0azRa3gwv3aUv3rcKWclrdhfIvI/SUX9r+HSkuG/cF4IADEU
         aRZ2Ms28YKAEtkFFOTlM+ku5T5em9eC+5rXcDHaZYankhO/ZQe04fdVTMYA73u+2re/w
         ayGLBvj3W1zI+V4HHblSNKWBRcSbMyIuQB5HHD2yr7t7nVqDcXMmqKw5LvId+c7ndrsc
         3rGkKu1js2oof3glW71NyMPkwFaOhn/vA822c3CMj6P0CMAryM4lQsnN9Q6/Qg+HvWwA
         7M1oAbosSyaIAe0AsVMMVDghdQMOBFbQglHVIHjs1WsWSYBrXY87vczDPJTREdjwRPPa
         gfBA==
X-Gm-Message-State: AOJu0YwMVVdJNRElKBLE4zj1x37KjrEbmmyRrc+6v3CnqTr+UvrpdtMs
	uTS+g08F9/hgRVc20hqT9oOBV/veE6iEea4OUIzncY5WRKg19ISrWoUYtrNbBpy9rE+hY7hMKtV
	MZaNqihTzdiQVxUqqMI8luHD45yi6noKXlUA=
X-Google-Smtp-Source: AGHT+IHp8uTnYP5ZDfSA9nDTMQqiwW2/KeBlbzBwsAfk6NJxXvnjP7qrlhZsbOu3mN8ppQYy8+0M10bxUDpqlCl9stw=
X-Received: by 2002:a05:6512:218c:b0:510:a4c:342d with SMTP id
 b12-20020a056512218c00b005100a4c342dmr393262lft.60.1706018981094; Tue, 23 Jan
 2024 06:09:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Virgil <virgil.hemery@gmail.com>
Date: Tue, 23 Jan 2024 15:09:31 +0100
Message-ID: <CAPJKW19RgcZzqY-cT6kwkO4AcXvKteTwzt4eZ6jJKqAzENQXvA@mail.gmail.com>
Subject: Input: psmouse - enable Synaptics InterTouch for ThinkPad T490
To: linux-input@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000593b33060f9d7ff6"

--000000000000593b33060f9d7ff6
Content-Type: text/plain; charset="UTF-8"

Please consider adding "LEN205B" to smbus_pnp_ids[].

Attached log with psmouse.synaptics_intertouch=1

--000000000000593b33060f9d7ff6
Content-Type: text/plain; charset="US-ASCII"; name="t490.txt"
Content-Disposition: attachment; filename="t490.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_lrqfki4k0>
X-Attachment-Id: f_lrqfki4k0

amFudi4gMjEgMTg6MzE6MjcgYXJjaCBrZXJuZWw6IHRoaW5rcGFkX2FjcGk6IExlbm92byBUaGlu
a1BhZCBUNDkwLCBtb2RlbCAyME4yMDAwVE1YDQpqYW52LiAyMSAxODozMToyNyBhcmNoIGtlcm5l
bDogcHNtb3VzZSBzZXJpbzE6IHN5bmFwdGljczogcXVlcmllZCBtYXggY29vcmRpbmF0ZXM6IHgg
Wy4uNTY3OF0sIHkgWy4uNDY5NF0NCmphbnYuIDIxIDE4OjMxOjI3IGFyY2gga2VybmVsOiBwc21v
dXNlIHNlcmlvMTogc3luYXB0aWNzOiBxdWVyaWVkIG1pbiBjb29yZGluYXRlczogeCBbMTI2Ni4u
XSwgeSBbMTE2Mi4uXQ0KamFudi4gMjEgMTg6MzE6MjcgYXJjaCBrZXJuZWw6IHBzbW91c2Ugc2Vy
aW8xOiBzeW5hcHRpY3M6IFRyeWluZyB0byBzZXQgdXAgU01CdXMgYWNjZXNzDQpqYW52LiAyMSAx
ODozMToyNyBhcmNoIGtlcm5lbDogcm1pNF9zbWJ1cyA3LTAwMmM6IHJlZ2lzdGVyaW5nIFNNYnVz
LWNvbm5lY3RlZCBzZW5zb3INCmphbnYuIDIxIDE4OjMxOjI4IGFyY2gga2VybmVsOiBybWk0X2Yw
MSBybWk0LTAwLmZuMDE6IGZvdW5kIFJNSSBkZXZpY2UsIG1hbnVmYWN0dXJlcjogU3luYXB0aWNz
LCBwcm9kdWN0OiBUTTM0NzEtMDIwLCBmdyBpZDogMzk3MjM0OQ0KamFudi4gMjEgMTg6MzE6Mjgg
YXJjaCBrZXJuZWw6IGlucHV0OiBTeW5hcHRpY3MgVE0zNDcxLTAyMCBhcyAvZGV2aWNlcy9wY2kw
MDAwOjAwLzAwMDA6MDA6MWYuNC9pMmMtNy83LTAwMmMvcm1pNC0wMC9pbnB1dC9pbnB1dDE0DQpq
YW52LiAyMSAxODozMToyOCBhcmNoIGtlcm5lbDogc2VyaW86IFJNSTQgUFMvMiBwYXNzLXRocm91
Z2ggcG9ydCBhdCBybWk0LTAwLmZuMDMNCmphbnYuIDIxIDE4OjMxOjI4IGFyY2gga2VybmVsOiBw
c21vdXNlIHNlcmlvMjogdHJhY2twb2ludDogRWxhbiBUcmFja1BvaW50IGZpcm13YXJlOiAweDEx
LCBidXR0b25zOiAzLzMNCmphbnYuIDIxIDE4OjMxOjI4IGFyY2gga2VybmVsOiBpbnB1dDogVFBQ
Uy8yIEVsYW4gVHJhY2tQb2ludCBhcyAvZGV2aWNlcy9wY2kwMDAwOjAwLzAwMDA6MDA6MWYuNC9p
MmMtNy83LTAwMmMvcm1pNC0wMC9ybWk0LTAwLmZuMDMvc2VyaW8yL2lucHV0L2lucHV0MTU=
--000000000000593b33060f9d7ff6--

