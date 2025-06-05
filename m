Return-Path: <linux-input+bounces-12722-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFE4ACEC7C
	for <lists+linux-input@lfdr.de>; Thu,  5 Jun 2025 10:59:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1117A16D3D7
	for <lists+linux-input@lfdr.de>; Thu,  5 Jun 2025 08:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2600D2063FD;
	Thu,  5 Jun 2025 08:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="egqsSe+6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE421E7C03;
	Thu,  5 Jun 2025 08:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749113937; cv=none; b=tm8RHYS/UB7JAK+ddO2lOkQRtqC/j5knkV3G7SZ/Hf91HVsBeiNhj84bQDfG8uhuKv5z46X8jo35DMtJ/GrRqBcVJguO8J13LKgZBqgN2Fl3eNnQZJBhfi2Ubdo186gNRd7YZ8oDYgKZm2zaQ6ZkLzfGrsBq7VZuTvwUsLyXoZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749113937; c=relaxed/simple;
	bh=mKrBiwt6AOlJQSevlQqWsIpniSpxAzoe9MQtZ4al1SA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HU40u9DABDa6qXAXB3n2hyzl9bY2VACaXc+O8q7F9jjkjOzGuibqXbemwsIuy+SEPvqEWPjEEJcpLpVP+jg4HznkQrvSQO1KTyokbZQ1gyl+TDDEkBBZyrtVU6pMnyn0Jt2h71kmjtMRFRYAXKk1BLoezfgPiVgpCfYrC02oQ0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=egqsSe+6; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2345c60507bso4873325ad.0;
        Thu, 05 Jun 2025 01:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749113935; x=1749718735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcE+ZTXZDvoOLkfVrKW5KI2HPJPv75omS4jE9Lo/weU=;
        b=egqsSe+6JgeCE7kpcxvz3vKFfM3IV+qvM8u7xFVTSrBx4hA5CaYi8JREWUs4IYe76O
         tzKd6sTJPMuQ6oIB+hVZCSRafQhrw3wdhd4luUEGQhcMxfTbgegIeoibAbi8Dz2PDoUW
         HXN/t09b/mh6ugEAjLs1kMmV9/8ToHD/e3ZcRSu4bfvWr4zIdR89BHq/wIN2dVDPMPq+
         QNNaIMIBdWtuHF7DuiKcPBYRE67GQrnkaLq+li3WPccPdKnSFqKG/dfvIJ/Xt7AaNhP7
         ZvyRQ7hO1gXK6k/46UXUoDxfsifJZd+DYtGkiO380F7FtPulr1qrTiU7O6GlGRUuNa/M
         S4uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749113935; x=1749718735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kcE+ZTXZDvoOLkfVrKW5KI2HPJPv75omS4jE9Lo/weU=;
        b=RjK8449kokKSAyo/sqUhMEh4MlhQc8aNp/V9KYaSsBGf8PzBEhG5e3MR2kIwymL+/i
         OHSX8temE7oUpIAvn/yAiJY4m1R3BOvC+Bn2eB1G9JNIlaqbbYik88H/llw0MeCBoL0B
         KXDRM1KVN0T7jn3ADhvVB4AW46HRUSgXzK6JfwfU0h2wx1CWeXs1vUYE4RkUeGqUiO8H
         41q+Y9gIfDKt06IFVa9129KLET34mWeEBlzxdpBio+/mGNKfgvIO9p2wdQvs61C+hTqv
         O9JMnMOq5Cf36tlEMlnkbui8pIRBfO9l9TgsuIPdctreCpR7Q8jg/NAT0eQW0fZ5Pgcw
         0/Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVfQlA6I6ETxnryhuf8uO7NhMj0Z+mUrDv3FfaWDGB6jQ4mehCInQduG3Sco/yr33nY1c62QLU09eQDkI5v@vger.kernel.org, AJvYcCWWCTB5c9jBMtRqW1vzd6jqANWtBn9PtY8mUjNY/XVmZKOPGr1GpRr5nSQMPfbqrJ6+pXiA8jgjR+RZmUw=@vger.kernel.org, AJvYcCWac4xMxspL97vImf/LDWs+jyKUPRbORJScbvNV3SjVFmDPYcEuRV26Wz98K/WnvXHIPq9wtcWJWEc5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0LowVPlaWHBi67H2seMLrdNdfjydTq8vuQGG8c3NbLUU6D0GU
	mmcbAZGt5xqtSbgyg4+fDiQ6IrgauCxe0X6yjquYfHzXq9dFpac/ws/M
X-Gm-Gg: ASbGnctcwZqd1r8YxpjxAnbb2ojka6w1gIBxFhivLbVPXQF+S3W9fQCh67ZL3TLRYAS
	Zaflhr0igYPxwwofVBYBFyAJ7tNV+pPPAKqMTEMwA6dDXpJY/mqe0eKKp+86Zmew744RSqmTTdt
	IEvaEf/QNUtF6ishUtKfyEUpDVJohdnzEI1uHdwj0zh0DHumDrVd9oO5A96bUs27M822+hyE/s5
	AyQc/PxeZmwrlqF4xMCn5i9BUmFpo61HwcO29lcnQEJNbM7uxa800mztGVq2l8PmxLR/dzAu7sO
	ndrlz+fJZubjYGMqqAftk9mL6Rjpg8rtUg6OkQj2V9tzl7IAzw==
X-Google-Smtp-Source: AGHT+IH6vkqchgwcIhSPAD5CrRInVnJne0qPyofCMs5iaGAkLr2B34y6cFmPWiKZWp6Lv3FHpngVQQ==
X-Received: by 2002:a17:903:230d:b0:234:948b:91c7 with SMTP id d9443c01a7336-235e121e2d4mr83159855ad.51.1749113934752;
        Thu, 05 Jun 2025 01:58:54 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506d22f36sm115857205ad.258.2025.06.05.01.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 01:58:54 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: krzk@kernel.org
Cc: charles.goodix@gmail.com,
	conor+dt@kernel.org,
	dan.j.williams@intel.com,
	devicetree@vger.kernel.org,
	dionnaglaze@google.com,
	dmitry.torokhov@gmail.com,
	ebiggers@google.com,
	fdmanana@suse.com,
	hdegoede@redhat.com,
	kees@kernel.org,
	krzk+dt@kernel.org,
	len.brown@intel.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mitltlatltl@gmail.com,
	neil.armstrong@linaro.org,
	pengdonglin@xiaomi.com,
	quic_luoj@quicinc.com,
	robh@kernel.org,
	thomas.weissschuh@linutronix.de,
	yury.norov@gmail.com
Subject: Re: [PATCH 1/2] dt-bindings: input: goodix,gt9916: Document stylus support
Date: Thu,  5 Jun 2025 16:58:35 +0800
Message-ID: <20250605085836.424932-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <0365ffe2-82c6-41d1-ab39-17fe4642bebc@kernel.org>
References: <0365ffe2-82c6-41d1-ab39-17fe4642bebc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, Jun 5, 2025 at 1:54 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 05/06/2025 07:48, Pengyu Luo wrote:
> > Document stylus support. Optional support for DT properties:
> >   - `goodix,stylus-enable`
> >   - `goodix,stylus-pressure-level`
> >   - `goodix,physical-x`
> >   - `goodix,physical-y`
> >
> > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > ---
> >  .../input/touchscreen/goodix,gt9916.yaml      | 23 +++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9916.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9916.yaml
> > index c40d92b7f..e5476ea36 100644
> > --- a/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9916.yaml
> > +++ b/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9916.yaml
> > @@ -44,6 +44,27 @@ properties:
> >    touchscreen-size-y: true
> >    touchscreen-swapped-x-y: true
> >
> > +  goodix,stylus-enable:
> > +    type: boolean
> > +    description:
> > +      Indicates that stylus (pen) functionality is enabled. If present,
>
> Looks like deducible from the compatible.
>
> > +      the driver will initialize stylus-specific input reporting.
>
> What if my driver does something else? Shall we change the binding? No.
>

Ack, I will drop it in v2.

> > +
> > +  goodix,physical-x:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Physical width of the touchscreen in millimeters.
>
> No, use existing input properties.
>

Ack, I overlooked it.

> > +
> > +  goodix,physical-y:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Physical height of the touchscreen in millimeters.
> > +
> > +  goodix,stylus-pressure-level:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Number of discrete pressure levels supported by the stylus.
> > +      The reported ABS_PRESSURE range will be 0 to
> > +      (goodix,stylus-pressure-level - 1).
>
> Use existing input properties.
>

With a quick check, I think there is no suitable property for stylus,
"touchscreen-max-pressure" is for touchscreen, not for stylus. AFAIK,
Pressure data is reported by stylus, received by touch IC.

Best wishes,
Pengyu

