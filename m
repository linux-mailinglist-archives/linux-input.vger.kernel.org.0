Return-Path: <linux-input+bounces-185-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1999B7F3250
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 16:25:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BF871C208D2
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 15:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1EF019BCF;
	Tue, 21 Nov 2023 15:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UOKl40bI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 217DF10CA
	for <linux-input@vger.kernel.org>; Tue, 21 Nov 2023 07:25:24 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a0029289b1bso254467466b.1
        for <linux-input@vger.kernel.org>; Tue, 21 Nov 2023 07:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700580321; x=1701185121; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zz8gkbBXufE/EC7nvTHjQQiY8tzszf3uuPb7T6KTUFg=;
        b=UOKl40bIvwF0CLLXFU0FL+gquhTWhoOicqJF6W27vBHBMn+xg0xyDCRtKghjup2Jr6
         O/jMfmTteqLBd8Ni04AfHOY3k6M8aaN5rsN2lbb4jSbwXGbhZs4/K8YOcjEtHw/w3oUN
         TaUNGnJ1cmtfOAbmCBUpLzifTf6wZEyurCqJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700580321; x=1701185121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zz8gkbBXufE/EC7nvTHjQQiY8tzszf3uuPb7T6KTUFg=;
        b=SVt/PV4RLxfkucOMdiuEMhbDweXL2cL+M06rKs81BPm3ACYEJXMPpAR/RU/2bVDBfg
         TWDNv1IyiK0VP4F0rOoLTjROLPgJDwYdODSHX+HF78E4p9W7sf4mZIrMHIve/dAOKhG3
         DbNxOflTJCD+3z1Uq5JMjCNfqXdamFbQLtNMwvYSKLBGzimnN2/2wWsg95sWHXjo3CHC
         NxLbrmu8yFJC5wrX/f1fMjdWlLn/RrA5aC2lMGY2xUNJN7OwzqWkI9T1rVombNi5ZZGT
         LR6zUMoMTF6rmG86DCggx+DB35P+7wxt/TQr/KhqZ4DgyknkltbOI5vF5evfH3P4kK56
         5DrQ==
X-Gm-Message-State: AOJu0YwkvXv6wLY74kjdSDzTgE+l05qLHggWaxB6CahTfBnJQ3BkqvF0
	c9xYL0bTNqvk2Aej2dEguBdYvyvI6SysbhnI9oOkREVE
X-Google-Smtp-Source: AGHT+IFGLJYu61OgD9Rfl8+olnDWGgVfTWoeCwuzfiAEmnf2g1d9EgxAGmmkb1dQfJxtrs2LXVUYoA==
X-Received: by 2002:a17:906:5347:b0:a01:de07:5926 with SMTP id j7-20020a170906534700b00a01de075926mr1615939ejo.45.1700580321068;
        Tue, 21 Nov 2023 07:25:21 -0800 (PST)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id o20-20020a170906359400b009ffba6f1aafsm2038097ejb.109.2023.11.21.07.25.20
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 07:25:20 -0800 (PST)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-548c6efc020so16412a12.0
        for <linux-input@vger.kernel.org>; Tue, 21 Nov 2023 07:25:20 -0800 (PST)
X-Received: by 2002:a05:6402:128d:b0:548:c1b1:96b2 with SMTP id
 w13-20020a056402128d00b00548c1b196b2mr2569edv.6.1700580320221; Tue, 21 Nov
 2023 07:25:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120193313.666912-1-hdegoede@redhat.com> <20231120193313.666912-5-hdegoede@redhat.com>
 <CAD=FV=U+emgVbnRT2yQonZ013CRmYXK1bxh8+xGGn5LCnOmL5Q@mail.gmail.com> <32d4a384-2fb3-4f67-9f14-7a639a0621bb@redhat.com>
In-Reply-To: <32d4a384-2fb3-4f67-9f14-7a639a0621bb@redhat.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 21 Nov 2023 07:25:08 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UPiW+6CyawQXUvSOj0QH8_ynFq0GZapHCrDVc7LNAmVQ@mail.gmail.com>
Message-ID: <CAD=FV=UPiW+6CyawQXUvSOj0QH8_ynFq0GZapHCrDVc7LNAmVQ@mail.gmail.com>
Subject: Re: [RFC v2 4/7] HID: i2c-hid: Move i2c_hid_finish_hwreset() to after
 reading the report-descriptor
To: Hans de Goede <hdegoede@redhat.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	Julian Sax <jsbc@gmx.de>, ahormann@gmx.net, Bruno Jesus <bruno.fl.jesus@gmail.com>, 
	Dietrich <enaut.w@googlemail.com>, kloxdami@yahoo.com, 
	Tim Aldridge <taldridge@mac.com>, Rene Wagner <redhatbugzilla@callerid.de>, 
	Federico Ricchiuto <fed.ricchiuto@gmail.com>, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 21, 2023 at 1:53=E2=80=AFAM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> > Right after this loop, you have:
> >
> > if (ret)
> >   return ret;
> >
> > That will return with the mutex held. It needs to be a "goto
> > abort_reset". You'd also need to init `use_override` then, I think.
>
> Ah, good catch, I will fix this for the next version.
>
> Assuming there will be a next version. Did you read the cover-letter
> part about the moving of the wait for reset to after the descriptor
> read not fixing the missing reset ack 100% but rather only 50% or
> so of the time ?
>
> And do you have any opinion on if we should still move forward with
> this patch-set or not ?

I'd tend to leave it to your judgement. I have a bias towards landing
it because it improves probe speed in a way that matches what the spec
suggests and, IMO, probe speed is important. It also has the potential
to avoid the need for quirks on some devices, even if it didn't work
out that way for the device you tested with.

The only downside you have listed is the potential for regressions,
but that's something that's a risk for nearly any change. This doesn't
feel like an excessively risky change to me and, as you've pointed
out, it's documented in the spec. If someone reports a regression then
it seems like we should address it as it comes...


> > I'll also note that it seems awkward that
> > `clear_bit(I2C_HID_RESET_PENDING, &ihid->flags)` is scattered in so
> > many places for error handling, but I couldn't really find a better
> > way to do it. :-P
>
> I guess we could just no clear it? Only the wait for reset
> wait_event_timeout() cares about its value and if we run that
> a second time then the bit will be set to 1 again before calling
> it anyways...    Not sure I like my own suggestion here, but
> it is an option. I'm afraid it may bite us later thogh if we
> ever decide to check for the bit in another place.

Yeah, I didn't have any great ideas either and I think it's fine as
you have it. It just bothered me as I was reviewing and so I figured
I'd mention it in case some brilliant idea occurred to you. ;-)

