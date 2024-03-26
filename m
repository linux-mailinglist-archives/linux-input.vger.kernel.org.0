Return-Path: <linux-input+bounces-2532-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D6188C406
	for <lists+linux-input@lfdr.de>; Tue, 26 Mar 2024 14:47:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BDD11F3AEA3
	for <lists+linux-input@lfdr.de>; Tue, 26 Mar 2024 13:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B247641B;
	Tue, 26 Mar 2024 13:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LZmL/4d/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E954974C05
	for <linux-input@vger.kernel.org>; Tue, 26 Mar 2024 13:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711460625; cv=none; b=AIFSmmlaiCDUp/CUp3inImMCEj4pdOQKXKZqUbkOrsEtc/8laiqOZmNQNLuSyXXhknx8QLm+3Cawgsihw3xhOXmpV4RsI6x37B9WVyLrF8St9rLTehkHMCljiD8nb/leTcGGSyXBofqvX+vcl88WCy+/Vzi71sfJaYxWygqIlS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711460625; c=relaxed/simple;
	bh=ljMe5J3C6/sjNT1yUQPJWicsFLE8AOz/s4ig62CFcoA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WGO1a9D5TeCl6bUDtvbKGLJVMrbQVuXVFff7kcBnFwHM8VjiGA93uRRG2qaH+WIViKYTGVrpV0J0XyN2JNP/b1/ulODaAU0wfP0VJ3nBDwZUC0rBBaSbmSJAZ3Y9Lg0UhjN3MhpTmHIBlh44EAbZMIAhwpTDlkWQYHG8f/7ws/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LZmL/4d/; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-695df25699fso46823966d6.2
        for <linux-input@vger.kernel.org>; Tue, 26 Mar 2024 06:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711460620; x=1712065420; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ruCfZHq43zIiPZrKz5ByYkrM7Dnhqu1J3mZX9CrPvSQ=;
        b=LZmL/4d/skmyJLELh6oIodn308sOvBbo35hv7F4qbyCgp9kE8hbUvwNc4W4LtGCLV9
         5Pl3eSsOxbezpOlTcDr2X6Rdc83EHvbjFYqBbmEYHRKUdxg+eTgtHrCLBop50KYW0ZZK
         OZCPF7VgNvWIQ30p7ErPVL65QdJZL/uXjMwJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711460620; x=1712065420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ruCfZHq43zIiPZrKz5ByYkrM7Dnhqu1J3mZX9CrPvSQ=;
        b=Bgy0ASUD+LkJOnO/zwi7U3BQRS2HxVXcer5/S3AT9Ut47KOeCPu29zRJWiBlKkHr4O
         sbjJYJyru3xCgqfINewIPghnAtBkOa2WjRvdBXWY0ZbzwiMghEY61vFM8949wCCbTNun
         RaYJsQRvPp8VhVyLKZgtBBg4894vtHi1S+p5GytijW4S9my/W2QR1ifkm93rQVHjzryD
         AChPv8vwjSrzn1DQhHci08SCbtCNgISFUGDhfaoPIgg2rr3fBUK5ZhJA9iMAypG3PTlw
         4SyRXgecS3EPicCwOkWHfiTpBKswtQQVWywSpAODUATO9Doe/B0rFHOvSDoHfa8DS66E
         SHdg==
X-Forwarded-Encrypted: i=1; AJvYcCXbQciFdbOrgPfydtusIP1N5Fg84DvunPFei/b8UEiYMgFBnm0tVfb32sFoFz1alBg3KhiE3f+qC2C17xM+77N/5Sf9Yg6Ts9pq5Hw=
X-Gm-Message-State: AOJu0Yx7rAZD/ibxJMWweNG2SYm9NlhM9uLnS42hgvRez5AZ9CVyCtbk
	UwsFfG1rSREAjaoQh5VsWkYlnZdWt6k2Eo8VVXG8k0SwMp5CZlt3qLrnknclnBPWNcqW1DBWi8Q
	=
X-Google-Smtp-Source: AGHT+IEF3l+MBQbO5fgRiNV7mTvgKt22LLulJkurjbbJjHwcWZxZgZzGdMZBNQlkjyAGcoyzczDrbw==
X-Received: by 2002:ad4:5cae:0:b0:696:8f70:e4f5 with SMTP id q14-20020ad45cae000000b006968f70e4f5mr7523187qvh.43.1711460620123;
        Tue, 26 Mar 2024 06:43:40 -0700 (PDT)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com. [209.85.160.171])
        by smtp.gmail.com with ESMTPSA id kd9-20020a056214400900b00696a3367c2asm319285qvb.28.2024.03.26.06.43.39
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Mar 2024 06:43:39 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-42ee0c326e8so204901cf.0
        for <linux-input@vger.kernel.org>; Tue, 26 Mar 2024 06:43:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWCdjuAFwFv6i+bwKvpLU7MOeYy0VIAm7Z745RAtqqLcA2vNsPLX9J2SLXyonS69lA9z3SCR8mec5tV+jrA512KZyy/0zXtjxaxgL4=
X-Received: by 2002:a05:622a:248c:b0:431:5ac0:a1e0 with SMTP id
 cn12-20020a05622a248c00b004315ac0a1e0mr246953qtb.12.1711460618700; Tue, 26
 Mar 2024 06:43:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325105452.529921-1-lma@chromium.org> <CAD=FV=VHps2d4dqLXCqE=hNMbk4pxeN607nFA0nEkd7chNAr3A@mail.gmail.com>
 <CAE5UKNpob9dT4YXSYKsrKGQ3cZP7o3OF7y-eb925Xd-gH3BEXA@mail.gmail.com>
In-Reply-To: <CAE5UKNpob9dT4YXSYKsrKGQ3cZP7o3OF7y-eb925Xd-gH3BEXA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 26 Mar 2024 06:43:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XdOOfHK-regXRzRkky0=iV2JMDPrKid2T_JS1=eu9H3w@mail.gmail.com>
Message-ID: <CAD=FV=XdOOfHK-regXRzRkky0=iV2JMDPrKid2T_JS1=eu9H3w@mail.gmail.com>
Subject: Re: [PATCH] HID: i2c-hid: wait for i2c touchpad deep-sleep to
 power-up transition
To: =?UTF-8?Q?=C5=81ukasz_Majczak?= <lma@chromium.org>
Cc: Jiri Kosina <jikos@kernel.org>, Dmitry Torokhov <dtor@chromium.org>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, Hans de Goede <hdegoede@redhat.com>, 
	Maxime Ripard <mripard@kernel.org>, Kai-Heng Feng <kai.heng.feng@canonical.com>, 
	Johan Hovold <johan+linaro@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Radoslaw Biernacki <rad@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 26, 2024 at 1:58=E2=80=AFAM =C5=81ukasz Majczak <lma@chromium.o=
rg> wrote:
>
> > nit: checkpatch should have yelled at you saying that you should
> > specify a commit in the format:
> >
> > commit b3a81b6c4fc6 ("HID: i2c-hid: check if device is there before
> > really probing")
> >
> I will do it, but I did run the checkpatch (with --strict option) and
> it didn't complain about anything.

Weird that checkpatch didn't yell, but perhaps somehow your commit
message didn't trigger its regex. ;-)



> > nit: I believe your sign off should be last. It's also unclear why two
> > signoffs. Did Radoslaw author it and you changed it? ...or was it
> > Co-Developed-by, or ...? You'll probably need to adjust your tags a
> > bit depending on the answers.
> >
> Yes, we've discussed this patch together and the original
> investigation was done by Rad.

Sounds good. Probably the best way to tag is these tags in this order:

Co-developed-by: Radoslaw Biernacki <rad@chromium.org>
Signed-off-by: Radoslaw Biernacki <rad@chromium.org>
Signed-off-by: Lukasz Majczak <lma@chromium.org>


> > Having both ends of the usleep be 400 is iffy. In this case it's at
> > probe time so I wonder if udelay() is better? If not, maybe give at
> > least _some_ margin?
> >
> >
> > > +       } while (tries-- > 0 && ret < 0);
> >
> According to Documentation/timers/timers-howto.rst:
> " SLEEPING FOR ~USECS OR SMALL MSECS ( 10us - 20ms):
>                 * Use usleep_range"
> It was also pointed out by checkpath (when I initially used msleep).
> I think giving some margin (eg. 400,500) would be ok.

Yeah, usleep_range(400, 500) would be fine. udelay(400) would also be
OK. The later would be more "accurate" but also more wasteful of CPU
cycles. Given that this is at probe time and only run a small handful
of times, it probably doesn't matter lots though perhaps the sleeping
function would allow more parallelism of other running probes.


-Doug

