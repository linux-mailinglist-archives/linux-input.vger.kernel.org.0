Return-Path: <linux-input+bounces-7700-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 061C89B0840
	for <lists+linux-input@lfdr.de>; Fri, 25 Oct 2024 17:29:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA654284A48
	for <lists+linux-input@lfdr.de>; Fri, 25 Oct 2024 15:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A16A21A4CB;
	Fri, 25 Oct 2024 15:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NRaGT+dV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF54F21A4A1
	for <linux-input@vger.kernel.org>; Fri, 25 Oct 2024 15:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729870178; cv=none; b=lWhqRMFmLeDG3aJBEXGT4AojuwEgJ/pqmh8DE7v7u6FKLZPpuiipXf+ORqkZSLE6+OSUIdVHp0p/ZLYxAUNMgKCMsNIFlN64BXqFcEC70uhBVP6i9otG5Q6Ef1R/UU9HFf6jSDiLq4jNQfzRw484k2wX+rLFqRm3XFjBxRhIA8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729870178; c=relaxed/simple;
	bh=mfVU3o+HrP2O0BnPv1WlOSU0JlgkC5nDnn2XkoVB8u0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gS3iJrjWbmLZmAR33T9t/+AcFpTtfqRYGzJGrpjFpK4JXrRiIRVyMOe1IZbhMaHkx1PKDc9/LLD2FrPvsEegNr5Buoqj7MpY34lhcydeyKSZX2TO177INItTGSeuujmeBQ/QVMGvNkVMYhHILgmiKyJqxppnWOH48k8OgNFzvP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NRaGT+dV; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539f84907caso2439915e87.3
        for <linux-input@vger.kernel.org>; Fri, 25 Oct 2024 08:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729870172; x=1730474972; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGXZTlcKhnhORAVfmpbxlvJi6p/7XxY3P3Hx5lHoMU8=;
        b=NRaGT+dVu4l7ByF1S2KZFQecyLR4ZZfaAY1HsDB7y8Fgy4GJZRhDPMjmPe6AJSvFEB
         6Qkl/3xrOW/B+vHVecgEkf5DbAq3pZVzQgF2ONF1iEtF9Ja6gq7YSMIMmmzZ34AwPHxa
         KXzStMHluzUbeBjrwRxJy2hiNcwUW7UyCYFhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729870172; x=1730474972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XGXZTlcKhnhORAVfmpbxlvJi6p/7XxY3P3Hx5lHoMU8=;
        b=LmfbqusZ//1EPQ9M97qdHn9Al1zePa2GKTdRTFVmwRVyHq+qLDjErif0zA1yulSbbj
         zzPOg7zVIwk7s7wSA0na/1Zn0KKhRY2xbXClysHYUQXXe1QWSf3/JtM3XXaYNAdZt7gy
         yyVFAmSOjthE07k73gQorqI+q+/BmYiPD/Z8lFy5c4h8v3S+dcSeL7YUm72jG5WtTVnh
         ipzoRvcFrH+DA8GdufP4vL3LdvG7RDUx1ewwJv70199LPbua/WLBsGgby21JW+AGbuaW
         Tmd7n8kxAPL11QyuqVGR6n7D1CfarTv42a1UJSo4zHlbY2KXY1Ml6JRE4uxX7ldbAybG
         kDMw==
X-Forwarded-Encrypted: i=1; AJvYcCWzf3kh02ZbIuRfDQxYZ+tYptLOYyJ9vQzfyyRi4zrBkOTAl6qjpZb4BlwKKbpr5bc1gixR7hXUK3YL4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmX1v0/BVhuSZTUUVdgvrLhKvbnIi3LLrQ71VXY3Av6CzjETrv
	vTpS8WB2uNC3mx0RyqSORShJ8OhZjsJn6LWlw2VQ4VcTn90EiMW0wIbgZY5lhmeyZMSJSp0RPFn
	C4Hcj
X-Google-Smtp-Source: AGHT+IGwG2YwV2yH0PoSNcYvb5K+P77l4NizkKePzmhNtb5B0/IN36IvnpoRSHPQhA2xCnIfpBE+XA==
X-Received: by 2002:a05:6512:3a93:b0:539:fcb7:8d53 with SMTP id 2adb3069b0e04-53b23e84e10mr3678112e87.46.1729870172090;
        Fri, 25 Oct 2024 08:29:32 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e135ec9sm217779e87.110.2024.10.25.08.29.30
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 08:29:31 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb5638dd57so22418601fa.0
        for <linux-input@vger.kernel.org>; Fri, 25 Oct 2024 08:29:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVIaixu/7vSvlj+Oo+wu8nP7eJ0sF389odHFWdylDTRPvUPfz712QbuFl2g1wGztmlE/RvAP1BHORxcEA==@vger.kernel.org
X-Received: by 2002:a2e:6112:0:b0:2fb:5ac6:90ef with SMTP id
 38308e7fff4ca-2fca81d665cmr29753751fa.11.1729870170017; Fri, 25 Oct 2024
 08:29:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241025114642.40793-2-charles.goodix@gmail.com> <3ypn62dsgarvmxkmdglugcinxmvpmhdqub2zvkygaonn54odf6@amfgijfcd3l3>
In-Reply-To: <3ypn62dsgarvmxkmdglugcinxmvpmhdqub2zvkygaonn54odf6@amfgijfcd3l3>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 25 Oct 2024 08:29:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X1F3QC=eSXcCn-78iQBzHMzT3z9Sis3yXKW_Bzun3+EA@mail.gmail.com>
Message-ID: <CAD=FV=X1F3QC=eSXcCn-78iQBzHMzT3z9Sis3yXKW_Bzun3+EA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: input: Goodix SPI HID Touchscreen
To: Charles Wang <charles.goodix@gmail.com>
Cc: dmitry.torokhov@gmail.com, hbarnor@chromium.org, 
	conor.dooley@microchip.com, jikos@kernel.org, bentiss@kernel.org, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Charles,

On Fri, Oct 25, 2024 at 5:03=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - goodix,gt7986u-spi
>
> Compatible is already documented and nothing here explains why we should
> spi variant.
>
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +
> > +  goodix,hid-report-addr:
>
> I do not see this patch addressing previous review. Sending something
> like this as v1 after long discussions also does not help.

Krzysztof is right that it's better to wait until we get consensus on
the previous discussion before sending a new patch. I know you were
just trying to help move things forward, but because of the way the
email workflow works, sending a new version tends to fork the
discussion into two threads and adds confusion.

I know Krzysztof and Rob have been silent during our recent
discussion, but it's also a long discussion. I've been assuming that
they will take some time to digest and reply in a little bit. If they
didn't, IMO it would have been reasonable to explicitly ask them for
feedback in the other thread after giving a bit of time.

As Krzysztof mentioned, if/when you send the "goodix,gt7986u-spi"
bindings again you'd want to:

* Make sure it's marked as v2.

* Make sure any previous review feedback has been addressed. For
instance, I think Krzysztof requested that you _remove_ the
goodix,hid-report-addr from the bindings and hardcode this into the
driver because every GT7986U will have the same hid-report-addr. I
know that kinda got lost in the discussion but it still needs to be
addressed or at least responded to. I guess there was at least one
other comment about "additionalProperties" that you should look for
and address.

* Make sure there's some type of version history after-the-cut. Tools
like "patman" and "b4" can help with this.

* The commit message should proactively address concerns that came up
during the review process. In this case if we go with
"goodix,gt7986u-spi" the commit message would want to say something
explaining _why_ the "-spi" suffix is appropriate here even though
normally it wouldn't be. That will help anyone digging through
history.

-Doug

