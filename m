Return-Path: <linux-input+bounces-14689-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 416AEB56427
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 03:05:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEC813A2CDA
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 01:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35DDB1DF985;
	Sun, 14 Sep 2025 01:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EukDtsiu"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C674D8D1
	for <linux-input@vger.kernel.org>; Sun, 14 Sep 2025 01:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757811906; cv=none; b=Bl4uI0+3NfRoyXJJn2JBPtJmWRWcin2wqjnU6f9MK9g732YPTbL8PVJEgFbDv+4MRPrMhbFUlokgZwAnkEIu8lkHoL/wbLvyzXQLOyATpXo9Wu9s/8MvtDctB6Eafd8O8I9PSSP+ztiz17b0eqyYrX8ny6SFyVAHc/DFXwCvHL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757811906; c=relaxed/simple;
	bh=KwCI67wzBCMSE+sGNwxoXxj0NxENSx9BrFmgM+/HkqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dve2CAmnXhfaqg4PJYxTfrngp0Sy1uK40QAIULTIPcu+LyOeDjP5+y3VmizkLhJlGV8qidhsKe077pAhBy5g5B+lM9yFVtPWQjGgut15FigouJ+umjhfchwHeTyX4cCC2pscfKIECrYtHNOTvj5gMIzau69krwK2WUb1TDslYMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EukDtsiu; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7761578340dso2226812b3a.3
        for <linux-input@vger.kernel.org>; Sat, 13 Sep 2025 18:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757811904; x=1758416704; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2H1DEIqxcw9L6IzZmS40PiTXQNGrmQIDZ9w4fzliZPs=;
        b=EukDtsiu4TYMBENT3Jz1pJqoRCMTLFTnyWsIw+7igIOh4Dhqotm6lW3oio9vk1zhpn
         7nNtztHfqPin0GgfXi9czeBVNAv8aHYtjutw7KZt1P4gqy3WGdL2L0TgwieGLqQGfbEM
         1Hwu4dv6MFp0NMEo7KDybWcfOgTse1P8l7HD5sTs7ZpxNkjfW65VFlKujrj419IEMuPI
         MwHMG5ckatft/Q0OLzAkiateIhnNcWTLggYICuorF2gNADoQ1CK7xmFrQYRMp8OfwJwz
         chnw3+8nfT7MsnZgl/6L0c4mtCtUHLmV+gIqJrSsJ5AfrhEbb/UGKHHJZxmZgW6MLQiY
         3rfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757811904; x=1758416704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2H1DEIqxcw9L6IzZmS40PiTXQNGrmQIDZ9w4fzliZPs=;
        b=r1gu7cHozk9FSueRSCrDQaIqe8wMvWGIT8fm/SReZtCN9RZQ+IOVlPOoiNCPRosRb3
         FlkqNjDFwipQ9xkTL1QA6kw/gmAlHrGBnFqYVHMvonGs0yneMZ4I79U5eJ4E2icEecvh
         0Oz5JtPRQ9bGsKC0I5aHTmTGFx3Qz8KTElNHIl1S3+eJKX2XgZ6abRqhM0uMQN/dPyLR
         2dt1hlhnUeKwNEsKv0+zhpDdTAf87RWjg3DTQeyY86RoCujuOVqbTm+QOrJNSfMP6R/I
         G1afsXdqezQnPRhEcoXf2LAQXURs27Ro0DNG4q8nL+XYMt+qMYUreho1kzgjvjysI3Bw
         VCHA==
X-Forwarded-Encrypted: i=1; AJvYcCXjKQ/jM0oCh3PR9RwD8RqIEcf1OLLVrhE2ai6Y6mEBHC8t3ZJgUlaiZP1rIPifqLuKRokcsH4H+SjL8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRFlzslW0MAU4hzJQYbrT5d6cz9V486Yot2sWFXKMwGtYK37cw
	mzurqWukk+vZbtY96eNurAfXlSErYDRauKEZU0mR7cMUzxSqVl9zAwqG
X-Gm-Gg: ASbGnct9gWG2OaqWjlVaex5LTOoH70KYCEY68A3gJlX0nfYNEjDD88k+/q9Mv2gUJNo
	FQbloi4TbfE7NRQTKaJzwblMw8n2Cw0w42JBLeYuT1V1TPL4P1xdiKlW3tIvxc4TLOd+uIbhWUB
	NW2kr85G7V5OrLuXxrFVvVR19aqjI1bCjdw9qjCNO7FXuTxZa1DjtfK9+GxenZw2M757pWgQv/E
	vyYy7Kd+68Cy0Oklqba+ZMSpKkCiLLsPevvVSua+dtcH8CvqUr1yMPheDVAompeiBtFClqWoJa2
	tvLXSClRYQwZ4PPYD06Wdke9iJV7ROgmTDtJyVCqVNmPL4zCZM1ln7SD0ADozJai6AQeklcvZ0T
	TFBnajCSHLsfUqQoa17jjNAIm3dGsvbFi00JjhtoYLmQ=
X-Google-Smtp-Source: AGHT+IH2JCR/UgWVMA5jNgjyGNIJ90r5/YIM6Tob3LS+1FHup5VN/X2Uo8gbBRUdy3Aa1wBnWJSvCQ==
X-Received: by 2002:a05:6a00:1806:b0:774:1ef3:78ec with SMTP id d2e1a72fcca58-776120957e2mr8003853b3a.9.1757811903861;
        Sat, 13 Sep 2025 18:05:03 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:81bf:abc:6590:f690])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607b346dasm9531512b3a.68.2025.09.13.18.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 18:05:03 -0700 (PDT)
Date: Sat, 13 Sep 2025 18:05:01 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>
Cc: Jonathan Denose <jdenose@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	Sean O'Brien <seobrien@google.com>, Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [PATCH v3 00/11] HID: Implement haptic touchpad support
Message-ID: <shsgwirjtyyo53lrczih3x3fracqtbwrlcfbdc6e44eddnglzb@ht7tyyngww2z>
References: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
 <CAMCVhVOUn-un9N_Bv00RVJ7kAw1O+AHgAHOzSGM6UuMBZVdtYw@mail.gmail.com>
 <vyhhm3x6nfdfw6gbgluq3sjr6bzamhear7nec6xdi5wfxq7wcz@cx2egj4yr5sp>
 <4267074p-78q9-54p9-8q43-2ro1n03259os@xreary.bet>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4267074p-78q9-54p9-8q43-2ro1n03259os@xreary.bet>

On Fri, Sep 12, 2025 at 05:28:03PM +0200, Jiri Kosina wrote:
> On Thu, 4 Sep 2025, Benjamin Tissoires wrote:
> 
> > > > Angela Czubak (11):
> > > >       HID: add haptics page defines
> > > >       Input: add FF_HAPTIC effect type
> > > >       Input: add INPUT_PROP_HAPTIC_TOUCHPAD
> > > >       HID: haptic: introduce hid_haptic_device
> > > >       HID: input: allow mapping of haptic output
> > > >       HID: haptic: initialize haptic device
> > > >       HID: input: calculate resolution for pressure
> > > >       HID: haptic: add functions handling events
> > > >       Input: MT - add INPUT_MT_TOTAL_FORCE flags
> > > >       HID: haptic: add hid_haptic_switch_mode
> > > >       HID: multitouch: add haptic multitouch support
> > > >
> > > >  Documentation/input/event-codes.rst    |  14 +
> > > >  drivers/hid/Kconfig                    |  11 +
> > > >  drivers/hid/Makefile                   |   1 +
> > > >  drivers/hid/hid-haptic.c               | 580 +++++++++++++++++++++++++++++++++
> > > >  drivers/hid/hid-haptic.h               | 127 ++++++++
> > > >  drivers/hid/hid-input.c                |  18 +-
> > > >  drivers/hid/hid-multitouch.c           |  47 +++
> > > >  drivers/input/input-mt.c               |  14 +-
> > > >  include/linux/hid.h                    |  29 ++
> > > >  include/linux/input/mt.h               |   1 +
> > > >  include/uapi/linux/input-event-codes.h |   1 +
> > > >  include/uapi/linux/input.h             |  22 +-
> > > >  12 files changed, 858 insertions(+), 7 deletions(-)
> > > > ---
> > > > base-commit: 86731a2a651e58953fc949573895f2fa6d456841
> > > > change-id: 20250625-support-forcepads-0b4f74fd3d0a
> > > >
> > > > Best regards,
> > > > --
> > > > Jonathan Denose <jdenose@google.com>
> > > >
> > > Hi all,
> > > 
> > > Please let me know if there is anything else needed from me.
> > > 
> > 
> > Dmitry, I've just re-reviewed and tested this series. I'm fine with it.
> > Can you give us your ack on the input bits?
> 
> Dmitry, did you have time to review the input bits, please?

Sorry was traveling. I acked the relevant patches, please merge with the
rest through HID.

Thanks.

-- 
Dmitry

