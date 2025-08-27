Return-Path: <linux-input+bounces-14359-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DA9B38F4E
	for <lists+linux-input@lfdr.de>; Thu, 28 Aug 2025 01:39:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CF011C23B71
	for <lists+linux-input@lfdr.de>; Wed, 27 Aug 2025 23:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A75AE30FC01;
	Wed, 27 Aug 2025 23:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aHuclbnn"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D4D30CDA5
	for <linux-input@vger.kernel.org>; Wed, 27 Aug 2025 23:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756337937; cv=none; b=PcwVk/cVjqWbR5/OgqERb3/YdQO38wjf/cpffAF/NJllGw76Eljj309XMhYoJayj+LoXiG+zcyzg9JjmCyw3qjzkHr3Y1TNpsGAWfPWJpCMTFQrzorSNohHUuNTd1YGQYCavLwjyivvP1OGu2BG6uJMWm8j3SsBOXS0FXLlVhTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756337937; c=relaxed/simple;
	bh=MNeQOS0pzr3dprcINe5o9nkq6nNaZGCx++2bS8YcTKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bLP7WuVHLlGaNOKiHBluS0er1IjIPIsRi9Pv5R5yDM7Y31GiV08w6JQ+XpBtbUxliUzviRlT6V/sOPNIz1K67LQaPe8vJbhqkEsoenLhB4zqVlz/rCBGwUj2qll86hzFpRribQDRFSoRAu6jAdCwncUvtwCV7pD96n1NCUT48FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aHuclbnn; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-246ef40cf93so4016865ad.0
        for <linux-input@vger.kernel.org>; Wed, 27 Aug 2025 16:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756337931; x=1756942731; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4COsJov1R6T5+fEFFn1/lYQvnIbPTGcTpVNB4EmSuqU=;
        b=aHuclbnn5a8gZebPt1zWX/2qqIQzQpnexgouymDJ1Nu6UamXjImIjaQXRi7/A3oIec
         zoeTBu2Y/ZRWnLT5Nb/Nq3sag14pYhiOJiegFojNrnc6Rq7CEy7jrg3vvGzDBUyBBsOr
         dijs+WlC5ODkeERJc8UVWyrNLhyN1s5Wrms6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756337931; x=1756942731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4COsJov1R6T5+fEFFn1/lYQvnIbPTGcTpVNB4EmSuqU=;
        b=ZG2BSKEV4JnfBnATS/eaIrUaD6IPNVKt6yXBWlAuWRjN3k7L9iEA68NBBygV62LDSA
         0X4sCrDA9gXEdIrdQ6flnSwMrcNvjuskrcL3S3fTrstLl31szWqeFtM7ZyR6YdYKwDHX
         QOQLDt3pp0cQwIJaOHvxqR8mpGfjCWIo+7cw3+zjFe9IrAoahw3LDM3A5Cf2v3ftdfFw
         lAkR74jOnF2JiXMlD9qJgUGOHOu8RtNgHIyExHCS89XtovTFuEH3eDlF60h88UrUXXEz
         5CyjKWIp5Qap+MhnesA2EGdUkwDV8CRzfYBUwgoV11QK+rYSERSaZeODAF640X8yKVJx
         z38w==
X-Forwarded-Encrypted: i=1; AJvYcCWc6Yk0RjirjH0jqWVFhYHWzcITcdWcafe4IpUMyVHEuJopniAQLs/HGeuJj8gx/OIP8ejYJQMmbh9RCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YylcvsBSf3YK8LZl9cZQ4Nai6Q3HB7l7fJNTh25F8fu/b6f+A7Q
	EitenPB04YwTYM7xvp5nBeBj7I/Zz16UBdSK4GKpUVk+OoHh1R324NDtQq+ibidlcCw6BVm79Ya
	NXQQ=
X-Gm-Gg: ASbGncs4+lBkR9+2sWdhbsa6pGMn4EGNRG3S+iplEEhXAKBL18saNKQ/CJHLIWToxXu
	3XYW2jx/0XW3GEQt8j+ucL1Pp47AGSRicZoJmp63HRe6HHMkMVTY3E10PZctL9vYroFdpe5w3Ye
	ICF5Bb142dgzt4i5L7Lj+Wkw1J8A0C5fTngjoJhDpr0rsveZT0ew7GSJPZC8QHNJKxb6SpoBIBd
	7UJ+50bCE3Fb9mrYo9PYx4IjnXp8PR88euiWgOlhfKIsfGmxN3ZFk2rFiqhRrO8DK3Gg0IDF0wa
	lVBHcpN5yHGt63BmGQ3ZseoLU+xjBtJZWBHys3TdJEOQJHdc5QcSb49No64IBXAmQFnEI+PChvr
	J+WqPS/Tyqy8/XLKfAGUQDOcLxx00ryfwouCrp+jUobBs+N4e/QudfW4n5iOs5TCWXw==
X-Google-Smtp-Source: AGHT+IFHJghR7SFXwH7J5twEuVl36WaOoMRlaZQSMyTmJlFrjRwWy52mwYh4Bu00lvVTKZ+pUNgIag==
X-Received: by 2002:a17:903:24e:b0:246:7e25:5cd7 with SMTP id d9443c01a7336-2467e255f5dmr200333915ad.40.1756337931023;
        Wed, 27 Aug 2025 16:38:51 -0700 (PDT)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com. [209.85.215.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246687a583fsm131151455ad.35.2025.08.27.16.38.49
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 16:38:49 -0700 (PDT)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b471737b347so299108a12.1
        for <linux-input@vger.kernel.org>; Wed, 27 Aug 2025 16:38:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVgDseJ6SIVJPn/c9pu0c6aeur5wjcFft5qZnM33RVT2NtNJZR67shd4hGHhsh3AuI5vm1X5um8lySK+A==@vger.kernel.org
X-Received: by 2002:a17:902:cec2:b0:245:fe27:fe80 with SMTP id
 d9443c01a7336-2462eeb004cmr295833995ad.26.1756337928476; Wed, 27 Aug 2025
 16:38:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aK8Au3CgZSTvfEJ6@stanley.mountain> <CAD=FV=WEQf=PX52Uv_bjzhnUipKwcNY+BBTOfDHucv=EkBTzgg@mail.gmail.com>
 <r6q738p1-53o9-273q-0198-327s56qpqn61@xreary.bet>
In-Reply-To: <r6q738p1-53o9-273q-0198-327s56qpqn61@xreary.bet>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 27 Aug 2025 16:38:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vqp7zDi=xGmy+gq+jSr1Tq=bRAUbkOVuVcz7C9zFbWXQ@mail.gmail.com>
X-Gm-Features: Ac12FXyRfmac0GCbxwA7Nta6zibOiKLyJotJFxyDjgBD9G3VZ9lGRLVwg_SFw9Q
Message-ID: <CAD=FV=Vqp7zDi=xGmy+gq+jSr1Tq=bRAUbkOVuVcz7C9zFbWXQ@mail.gmail.com>
Subject: Re: [PATCH next] HID: i2c-hid: Fix test in i2c_hid_core_register_panel_follower()
To: Jiri Kosina <jikos@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Pin-yen Lin <treapking@chromium.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
	Wentao Guan <guanwentao@uniontech.com>, 
	=?UTF-8?Q?Bart=C5=82omiej_Mary=C5=84czak?= <marynczakbartlomiej@gmail.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kenny Levinsen <kl@kl.wtf>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 27, 2025 at 8:39=E2=80=AFAM Jiri Kosina <jikos@kernel.org> wrot=
e:
>
> On Wed, 27 Aug 2025, Doug Anderson wrote:
>
> > > Bitwise AND was intended instead of OR.  With the current code the
> > > condition is always true.
> > >
> > > Fixes: cbdd16b818ee ("HID: i2c-hid: Make elan touch controllers power=
 on after panel is enabled")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > ---
> > >  drivers/hid/i2c-hid/i2c-hid-core.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org
>
> This seems to be missing closing bracket :)

Fixed. The tools would probably have caught it, but better to be safe.
...actually, "b4" fixed it for me. :-P

> > Jiri / Benjamin: if one of you can give this a quick Ack then I'll
> > throw it into drm-misc-next with the patch it's fixing.
>
> Acked-by: Jiri Kosina <jkosina@suse.com>

Pushed to drm-misc-next.

[1/1] HID: i2c-hid: Fix test in i2c_hid_core_register_panel_follower()
      commit: 5c76c794bf29399394ebacaa5af8436b8bed0d46

