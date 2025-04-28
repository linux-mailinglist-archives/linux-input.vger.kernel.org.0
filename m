Return-Path: <linux-input+bounces-12050-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC19AA9F985
	for <lists+linux-input@lfdr.de>; Mon, 28 Apr 2025 21:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 351B817912A
	for <lists+linux-input@lfdr.de>; Mon, 28 Apr 2025 19:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 802AA190072;
	Mon, 28 Apr 2025 19:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ha6hfHDr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AED42AA6;
	Mon, 28 Apr 2025 19:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745868653; cv=none; b=H8xZqarW7IhRN3CytiqdZo7LJRUdeUv2QEnzhjNMBaeD4gJpgP9keo5c4qAefB0FOdxMLnh6DbHtp4GQBbDn5P0f7JLU3mc8HP+pByAwzumUbh4dmWufXLybn2wyQnGuIuqDBXmlnDrqLY+pIsVmXEEd7YazyzekNbA/IAG35BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745868653; c=relaxed/simple;
	bh=TwYt1P/LJlat0M9t+rVzFLvzyCeNVLRnTX5hC5Wb38o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iKfw07fzKXI6t6ePLF5b1HVtw1O/5Uj3SSZvHs5WD3uxuOsPHnwFiTSdPwMl+G0B4GeUUVGWXVY1DA//2P4LlEHwn6JY1/h6SdVuRSuUAd4gcA+qlo1FsffDn68reuPpYf/7nLb+I31gPMvzLsDoecnz6EYYDklkOPNBW3bU3k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ha6hfHDr; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b07d607dc83so4586417a12.1;
        Mon, 28 Apr 2025 12:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745868651; x=1746473451; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tpk6VzszwWxTTij49TZSclL6cNM9y9IHMjKw/7hWAFc=;
        b=Ha6hfHDr/ATdAOCxZmtvBQ6nptL1mJpAt2idHpRda4XyXyr3JHXN2ARabj3mHyUYAu
         DQ/bmzfrfcHXKrG10J864a8k2BIacQ+p+qHaHjRrv4nh3neFygRLNwoKzdAkdoQ3Ki2Q
         qFqw2dBiIQTv6PRy82Atz0dfgYg7wraqBD0MUThWRHBOkkcuiHNrMlJb5l+ZJc1WesPi
         evIYd8ent20RfQp14u+WR4Y4Y1gqWjiNmEZZsrlr1pl9VTmgcYhPa9XqKz1+qJ68zA2o
         /C0S7kkhDNEe+W47/2Ljz1ygcIkGsw9MWahNkj5DpnnPQu+ulrp4EbfsB17umDAh9171
         DnTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745868651; x=1746473451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tpk6VzszwWxTTij49TZSclL6cNM9y9IHMjKw/7hWAFc=;
        b=Qlq5vNQgguCZtlFMMwaJhllLCJwVn57gHohYvluaB5OPMBYvJ574s5Buc7AZPtcQ5J
         8ThRFEWrtdiJ1gjy99Zx0F0oqM9ccBTBGWvR8M0eKX3Pm2fMsnYWD05kua2DhnLxsLsB
         EzsYnKxO4/6a/pYYZK/qRXyFvEByz7uvUuQqLqro+Ez6TspIiIBOH3lWtdDoq5Es/0Pg
         YhKP90uJBCrp7SMl7K1bnpEMteEFwjaYZmXh4Qaimd2ouAlpEx0GBdZ8ibD5eqFW7acD
         UZD0Kmz03ahcJmfVb1vvhZoUKWPZV0nkDikn4sw52rfHRXNq1r7O6EzL/qvARgGNu9af
         QcOQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+RpPstFvpIvSbyPW/Vyw1EA04AlWPYPIIUcJW+uzGLj9Dy9duoyh8hhavicVjgTyG4fd+Wa73u6WT@vger.kernel.org, AJvYcCVGhFADZFA9ehv/IxK0/yZ2JjA7DR2RdvrkkODkfvlxNWPgFEBaOorpSlYMZX4gWx0UbEMT9ThJJSH34fU=@vger.kernel.org, AJvYcCVdR1dWhpkNDIPGqoboVWvSFge6gMQbxqngR5fPxK9TrpXv1yGsTJI8zk4EgMZSC8B9UwF7ORe8l0U2dQg0@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0SUbG3WqTHe4bz72El9Nqytjw37KQ9yHSil4sGvcaApaMlx9e
	PNosou26UhqrxYTLEsH6UsgUcbLUPx6s6cMX5HRRr4UUHxOHHOVU
X-Gm-Gg: ASbGncvKvF8aMgtSx4Mi1nLKVx5N6BFeI4fAdCx1QvaAKk48XqXN8r1JKLY6K2w6EID
	tFgCQ7rEULy7yB0APYSzkHal1/lPWFymxZwOIIyXQxwbAZ1Ur1moRtPFbqr6UE/HteWSCYJIUBY
	dSLLD/IMr+hgAXxtEMFzUC/lHXYcmJmwQ+tjJOdgTqTv2v6zaxtwlhJ9rqChfrn/LocF5Bo7JsO
	jkGHF22fFv6P64+CGE44rQzV/vA5RCoNn8rVNkTlmKFrkgHjKn9O/p0/rFjeufjp/qYUhkfBMfM
	rDuVA7C5KDuD8LhCw0IXsOfTHyil1KInFdssZCHe
X-Google-Smtp-Source: AGHT+IEbca48Y0EHHhxNixOZyjB2dSXXAABzJVN1lWbW/1bawIUzxMMkYSur8t5IQFCnd7qluqebnA==
X-Received: by 2002:a17:90b:53cc:b0:2f8:b2c:5ef3 with SMTP id 98e67ed59e1d1-30a21550733mr1642662a91.14.1745868650995;
        Mon, 28 Apr 2025 12:30:50 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:67d:4372:d1e6:def0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7636sm87291995ad.117.2025.04.28.12.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 12:30:50 -0700 (PDT)
Date: Mon, 28 Apr 2025 12:30:47 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Esben Haabendal <esben@geanix.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: input: touchscreen: goodix: Add
 no-reset-pull-up property
Message-ID: <23onpttl3w2wo3625c7flbljahojipsb4xznrx6xynr7rrzofr@2bcvjji7dpu6>
References: <20250422-goodix-no-reset-pull-up-v1-0-3983bb65a1bf@geanix.com>
 <20250422-goodix-no-reset-pull-up-v1-1-3983bb65a1bf@geanix.com>
 <20250428-logical-successful-spoonbill-cd1c6b@kuoka>
 <zkDFUv9azjyXaS--ufxgROyruM2mpckWkDNeHtAO160rM2DuaJthpjgN0c_L8QgTk8bNA7Km0UewYmp1rWENwg2x4ngP-8C1rYhHMgAz0OA=@geanix.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zkDFUv9azjyXaS--ufxgROyruM2mpckWkDNeHtAO160rM2DuaJthpjgN0c_L8QgTk8bNA7Km0UewYmp1rWENwg2x4ngP-8C1rYhHMgAz0OA=@geanix.com>

On Mon, Apr 28, 2025 at 07:58:55AM +0000, Esben Haabendal wrote:
> On Monday, April 28th, 2025 at 09:48, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > On Tue, Apr 22, 2025 at 05:15:02PM GMT, Esben Haabendal wrote:
> > 
> > > This should be added for boards where there is no pull-up on the reset pin,
> > > as the driver will otherwise switch the reset signal to high-impedance to
> > > save power, which obviously not safe without pull-up.
> > > 
> > > Signed-off-by: Esben Haabendal esben@geanix.com
> > > ---
> > > Documentation/devicetree/bindings/input/touchscreen/goodix.yaml | 4 ++++
> > > 1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> > > index eb4992f708b70fef93bd4b59b9565123f7c6ad5d..7e5c4b98f2cb1ef61798252ea5c573068a46d4aa 100644
> > > --- a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> > > +++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> > > @@ -45,6 +45,10 @@ properties:
> > > reset-gpios:
> > > maxItems: 1
> > > 
> > > + no-reset-pull-up:
> > 
> > Is this common property? Where is it defined? Otherwise missing vendor
> > prefix.
> 
> Good question. When is something a common property?
> 
> The idea of marking something as not having a pull-up on the reset pin could be considered a common thing I guess.
> But for now, I am defining it for the goodix driver only, as I am only aware of these devices needing to handle it in a special way.
> 
> Should I rename it to goodix,no-reset-pull-up?

We already have GPIO_PULL_UP/GPIO_PULL_DOWN flags available in GPIO
bindings. So maybe the correct way is to have the driver rely on them
and only leave the reset line in high-impedance mode if GPIO tells it
that there is a pull-up?

Thanks.

-- 
Dmitry

