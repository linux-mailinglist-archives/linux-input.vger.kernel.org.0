Return-Path: <linux-input+bounces-12075-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E03AAA1154
	for <lists+linux-input@lfdr.de>; Tue, 29 Apr 2025 18:10:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DD554A6955
	for <lists+linux-input@lfdr.de>; Tue, 29 Apr 2025 16:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96FDD242D94;
	Tue, 29 Apr 2025 16:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J0ftIZUC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FA4217F27;
	Tue, 29 Apr 2025 16:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745943004; cv=none; b=KsbJoQsV1DKnG4eeYU4IIetV9o6s1hXSKpL5MXJbAjk6PSoz+pLhXfuqJ/RK0/accC8sytSdLrtDInY+vzXTFLmPvygk2hEz+DHdY7SoTDlUJie82Uo9Up6nCqXCxNKZCOieVfZJATVbVnS6Lrkl1JhT+yif2f56V0vBEpw1YT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745943004; c=relaxed/simple;
	bh=gQOECnHyi5YsqI/wovKB8htGE1EJ1z9Hy2iScY6OoZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ThKsvqd7t7B0CJ9aO8uiortxCrVxXJzLoRJwhgndXSrv/eQEqkTcVqdY9FO4Thu4SOBQP4WymkX059CAlrjUQN04pEggWKyp33GJHgZg7fLDjW/FxAycHHJLQKmSIhId7ZjnszoVZnxoviA6jREA110sisPGEgx6fyak5yVhEGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J0ftIZUC; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-739be717eddso5137767b3a.2;
        Tue, 29 Apr 2025 09:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745943002; x=1746547802; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2B5qENygMidXKJeYIpIMae3o3JEApgWUkkNB4KGW/vo=;
        b=J0ftIZUC1zPPzmi1vvs+vyZhxgEO8oK0saRrb8YR6JgRu/uCiQGY+YBPqFsg/Fb+Ed
         FcKgP34llx9qomAEVoj2AZRy/91iM640rUGgnHYe7RARAHfjzCR0e/95hrSJFbr6dtjk
         vlzFwA/JxMXolf51ENlUxPeQy7M1A+yG+nYUG/KC8jOSyWJL7abCil9dcrHSpAOrq1vb
         twsNqRJs2a71ZXj3vRnPzThddH3xOm9kOkDNrkwqmc98pphDCk5O1uQzJwzNlYeYvr+X
         svidb6SEFSWmkrK1oTMayGGhULLUwt8c54baFVd92aIhfxSRPd7D95v657562/UlsIpP
         phOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745943002; x=1746547802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2B5qENygMidXKJeYIpIMae3o3JEApgWUkkNB4KGW/vo=;
        b=vTo/qMIN25AwP3iFvgVbXHVYNWqzHw2EVrjKpmXDzzNQMB845LEiH3gKXaZ9PYx1SE
         OZ10pOEAhc1gfmu0ScJtJh4TU+u5CyckBB8VIp7NXDjDSH7/Y6w8+Mc5zgmS71m0hvoC
         b6QVoWEBHh3hAllNztoeECc5Bj+zqPgkaw2F1g/JqGUKczLgO3+HBeUdv4Kvh/4Q/cZl
         kTdHTjFgFvt3YqIhKh1oYxohTwVMmVOp5w1buOY5xT4pnOX+F1bAt34FxUfQjyBNeIIz
         ScP5QLurXErFyyc1M/1ubndwPo7BHjXcbyfmitvwnAMhMmzz3ihRpfsnYCX3gcFYQH+x
         ULwg==
X-Forwarded-Encrypted: i=1; AJvYcCU7JzxfvCUiifexbV0uAJO8ezwllaDjtyeIzIDhMp5bZ32GbZJzTzz/2aUm6fkBucvJY/f8RCgAw276dfo=@vger.kernel.org, AJvYcCX19OpcjU19w7csTnYVv7hFO38Vd40TTSzXtEXwdIp7RCoqti/p3EhlaZmY6npc5MHioaAdzuLXRNTKD79Z@vger.kernel.org, AJvYcCXWzKKDPUk4MsXY9/W9xW+w4oc0ly2SnRsneOJDJUOwgGxNMnnVb1DowhdNNJdk9n5OOEq51QANIc1b@vger.kernel.org
X-Gm-Message-State: AOJu0YySH0h843u/XutHCRKCYuM3RJtcFtWt7eJNfWN1fAlnaVi/8/NL
	qQIEIMq9fgHIPPY30utVawGQqbDC/DwGfyUZfFUswDsc21XPfx2c
X-Gm-Gg: ASbGncvH1gWDI/3kekZ6I/w6iP4ICktO2aUi2nWtV+Xz22Wp3BbO9QEVHoPqcVZJZf4
	FNfNIc892RSFyy9m+zex+VpNpd+6JaqApRL4mMNNzbxBFzev70BOsOCxHLCQcjcbssGGiLMwciW
	OXem0o9I8JVGmuWFSGuUD860HJ0Cnni8+IMkTbEGPJAxkNEoZzeS5LFyjMjzvtmJG6M04Lsh/Kz
	cNprLS4vNOtPhco71W3Rq6RVW1ctRYwShP2+OG6jFR2l5iyom8YaeDAr77Qn/Fx3k9MOLPFsaR+
	GvrlqSQkgprW/bZRnLJFxzwkcrI1hgIo7k2lQTxHTg==
X-Google-Smtp-Source: AGHT+IFJXA+JUl9XZQeMm1jD33AZmNE9lmmbmnwd59z6JU57Fzy/YxxJ4Z562yGuwuW+5My+9fiFzA==
X-Received: by 2002:a05:6a00:ac5:b0:739:4a93:a5df with SMTP id d2e1a72fcca58-740294703dcmr4534450b3a.12.1745943001926;
        Tue, 29 Apr 2025 09:10:01 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:adc2:8397:4f51:d5a0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15fa80fa6asm9150594a12.61.2025.04.29.09.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 09:10:01 -0700 (PDT)
Date: Tue, 29 Apr 2025 09:09:58 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Esben Haabendal <esben@geanix.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: input: touchscreen: goodix: Add
 no-reset-pull-up property
Message-ID: <2qwfe6yw3pil5tumibiagikqhgwct27vevi674fklfieabzozc@hzjwatn3vjss>
References: <20250429-goodix-no-reset-pull-up-v2-0-0687a4ad5a04@geanix.com>
 <20250429-goodix-no-reset-pull-up-v2-1-0687a4ad5a04@geanix.com>
 <qql72NifdMmJKSRJmT2927URaXnbRAbz9Yjzn9lBrOwjka7NxVvy5YKJUSLmBp435aYJiTkPqeuW1hMDcKKC4g==@protonmail.internalid>
 <20250429-effects-subscript-58eb41737816@spud>
 <87selrt1vl.fsf@geanix.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87selrt1vl.fsf@geanix.com>

On Tue, Apr 29, 2025 at 05:37:34PM +0200, Esben Haabendal wrote:
> "Conor Dooley" <conor@kernel.org> writes:
> 
> > On Tue, Apr 29, 2025 at 11:56:11AM +0200, Esben Haabendal wrote:
> >> This should be added for boards where there is no pull-up on the reset pin,
> >> as the driver will otherwise switch the reset signal to high-impedance to
> >> save power, which obviously not safe without pull-up.
> >> 
> >> Signed-off-by: Esben Haabendal <esben@geanix.com>
> >> ---
> >>  Documentation/devicetree/bindings/input/touchscreen/goodix.yaml | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >> 
> >> diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> >> index eb4992f708b70fef93bd4b59b9565123f7c6ad5d..21ac13046b6e021eeb403d854aabc945801dd29f 100644
> >> --- a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> >> +++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> >> @@ -45,6 +45,10 @@ properties:
> >>    reset-gpios:
> >>      maxItems: 1
> >>  
> >> +  goodix,no-reset-pull-up:
> >> +    type: boolean
> >> +    description: There is no pull-up on reset pin
> >
> > I have to wonder, why are these system using the reset property if the
> > reset is not usable? Shouldn't the property be omitted?
> 
> The reset are fully functional. It just have to be controlled in
> push-pull mode.
> 
> Because of the lack of external pull-up, configuring the reset gpio as
> input (to save power) puts the reset pin in an unknown state.

How much power do we save by doing this? I don't recall other drivers
trying to switch reset GPIO into input mode after performing reset...

Thanks.

-- 
Dmitry

