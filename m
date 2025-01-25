Return-Path: <linux-input+bounces-9535-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CA2A1C546
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 22:25:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0339A3A87D8
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 21:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08F2A204688;
	Sat, 25 Jan 2025 21:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E25DTb5y"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6148280BFF;
	Sat, 25 Jan 2025 21:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737840312; cv=none; b=DDm/1Au++DV1L5EbtdM5UNl5lp3/reye2TvJ3D/I2+XrYa1kQSomy9DYpCy3Cm2qLGi4RJyy/jsEQnUpo2hTcsKBbq8mSIJMFP78+TUe5pMMT5/1mGrEFbGj34Hi9uuUsRKKQvHUOR5c/oBfA7nLpnIbaQl14XqzpODx9IZYg4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737840312; c=relaxed/simple;
	bh=Szj7d3/sekKDu8NPmxDwFcF09WoaB6kv8Ww6G+TcBvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K9Q1jADKUpz0vkJMIiJg8TSLFylXYtQl3EoGlxddtvRzEOOj4DJr2RoYUO52d90eMhyHMCfTJT+uneJldHZV+FWvkM/YaBmgX7HwJTd1B3zIPIYPgekbKbS+RQq5McxLyGr5jOaSVWVUOXMSPnJ219w4FBxghKtCdLSQomjB+iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E25DTb5y; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5dbf7d45853so731559a12.1;
        Sat, 25 Jan 2025 13:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737840310; x=1738445110; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6M2N1/AGtsZpzgB08GZmYjyx8nVha5rZXMasvwxOu0k=;
        b=E25DTb5yPpu05QjJY16MI3RdQe81LNmYwj4QGLK0fAYEQlb1sLMeKoY+kHM0oit2gZ
         1kH5aKFyjxufzSCnAB4yPjfFYRBh9ZUGghAX8y++l75WGjCSfqH2mKkzB3+xDyp1V3M8
         NWEcI3PGO1SJH+V21jxb3yM/KEx82VnhJKO/13OfRmly2IsVN+O5fHpqchc0dedq/7mH
         56P+qLC/ZopPZnqt0gWlbYQB6nJY6jSr+lX1aZsUKUtwSgP9xgzohQ8UGyDntdfuHVi8
         UTcx9ZloLaP9G3Cb5JnwMA7/blSXCS8d+tfCc4m8E6jzMM8sFuKSb5MifeoBhdmCG4EG
         57Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737840310; x=1738445110;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6M2N1/AGtsZpzgB08GZmYjyx8nVha5rZXMasvwxOu0k=;
        b=Sq49cuAZC4kcMkcp0BI626HId3s7AwMo4Ko46gnubo8F60aNVBDOHqpXKYgkqErq+a
         EAWfefZNMyKPtrZ2Nimh9g14RfRvfFoxTU4qRvvjE+ufkbY9MWKOKgN0ydZfB+mCLTOR
         TT4C31wPzLXrjBQTemOZtgqxkzp3xulM/V3oSeg6BFb8RMd5leGgNYhF8OCZ6zayWPpY
         ei4+eaycSxVPlXp1WDcx2hEjGhxMK4kb/N6DItRPJAk+58t5yVPupXeNXzs7vl7WLYOG
         6DUGaMXUIiAtFETt+99aIrPEmQ1ydT549UN1WlHnBRo2eOksr2vAUkXGSuEOY2R6HnkG
         UmMA==
X-Forwarded-Encrypted: i=1; AJvYcCV82B59lrx5LZsAco/LTbZtFFHGf6767sZdaCG2ki/eDTssJNUEpZ5LFpHcDEjhLQa/fmpvTd2hJAyu@vger.kernel.org, AJvYcCXQD576wNoP702tVIm+J8BPwx46tVLRGxkgkFM5yA7l9BTHkNCuYtCyXWB5Zdho3iKkQDB96zQv6fQPeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUZkItrL6M80iSuQfgv3XXMO6srXWxd/XZt5bdGI9FkWGBHFdN
	NC3vSOmFw0shzm6J7hbk5ssSp0cHhBTla6JDOMC96JQVj1HMt7Ix6ZxBn1uIbnQezPwZXGR6z2c
	EiAttDW2V+UU12VMz9diDuyB1AvwGK9rb
X-Gm-Gg: ASbGncvsW9tGDo8uXhawhZJVZB9HhqF47vGzW+1UDIRXQNA/S8qotddrXBsjyvucSoN
	0iXEtuK4CQiVsiLG+FzWjuuYtvkiroRafQIqTm3mQr4NX5NnURAonnuNNR0M7
X-Google-Smtp-Source: AGHT+IFKc5PeMtxVZJ3VLyZsAXUxRSMfj7X1IuVNCnq366J9aPVPb8At2xrSNsLG1EQ73pS9iixzc/jJPHItH5AXSX0=
X-Received: by 2002:a05:6402:4011:b0:5dc:68b:572a with SMTP id
 4fb4d7f45d1cf-5dc068b5803mr4648418a12.8.1737840309340; Sat, 25 Jan 2025
 13:25:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250125125439.1428460-1-tomasz.pakula.oficjalny@gmail.com>
 <20250125125439.1428460-12-tomasz.pakula.oficjalny@gmail.com> <7e44473b-4390-4dd1-9beb-386a2648f36f@gmail.com>
In-Reply-To: <7e44473b-4390-4dd1-9beb-386a2648f36f@gmail.com>
From: =?UTF-8?Q?Tomasz_Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
Date: Sat, 25 Jan 2025 22:24:58 +0100
X-Gm-Features: AWEUYZkNtw1ZkwECWFkJpdk_Uy78rGL2ktufQl_xzt5MXzaBy9mSrPuUT0WXyZU
Message-ID: <CAFqprmxwAKynTw141Dmvwwe5kFgX5S-svYnVw-nsnibJwp7M=A@mail.gmail.com>
Subject: Re: [PATCH v6 11/17] MAINTAINERS: Add entry for hid-universal-pidff driver
To: Sergey Shtylyov <sergei.shtylyov@gmail.com>
Cc: jikos@kernel.org, bentiss@kernel.org, anssi.hannula@gmail.com, 
	oleg@makarenk.ooo, linux-input@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 25 Jan 2025 at 20:50, Sergey Shtylyov <sergei.shtylyov@gmail.com> wrote:
>
>    This one should be indented with a tab like the others, no?

Yes, you're right! I already fixed it in preparation for the next
version. I can't seem
to force my editor to behave nicely and just leave the tab indentation alone.

Thanks, Tomasz

