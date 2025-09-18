Return-Path: <linux-input+bounces-14827-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F28FFB828C4
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 03:46:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B280F325C23
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 01:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3568B188734;
	Thu, 18 Sep 2025 01:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FZ79K9ds"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B463212CD96
	for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 01:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758160006; cv=none; b=ZNSg0lNb3AG8MpZxpyZu1p8nDvvcKht1LgcrCimzZMPsW5dSUuwuw5Qhjo+epmmwgvMcfHuicsPRnREWvFsJrve8JrCXxgobfhm6otfGE1USTPnnEti7nigRsx3ouIoYXtkRURQ3f587GtJ6aaj8A0LRN2JxpKgKIcTtcZaSEUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758160006; c=relaxed/simple;
	bh=Y1L1HO2ER0yGATtMeo6457ei3YCrxJF9T8bAgNAYWB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hY6CNqxkp7SNb2dVjfhoSb52vdG2gyCNFc6neafGNi+j6PZBKDHltnJa5/pbJWq7uSqhLz3W83RH6T3FYV6u1F1ZAp8wQxen5reUN9YcDWe2/QObHHy+UxFixVUdtCrA9/Lhmhp8nM6L/NRDNfSW0Jv9i3/O+lpREuJtgt3/Wuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FZ79K9ds; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-ea5c8833b15so372387276.1
        for <linux-input@vger.kernel.org>; Wed, 17 Sep 2025 18:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758160003; x=1758764803; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ztic0itTb092Cg8phgOMtBzjG5miAwDaU95tKvoCG9o=;
        b=FZ79K9ds5qUX61monNgpC9K7AIGv9kPI9wToWjXcByaQVeElBM2cb7ojaDCoj/APp9
         0Vm8UkpoAs9XG7BxOyRHTUZeYOYCv2UVkGpNV2I47sGtrEZPNydgQek1gJ/lOa/Esup5
         LIY+O+wJb8MPIF5yWDJpGPRE2gy8JqRlK+K2GRPXf21KvVDO7g8YWF78+omy+jrpa9nV
         ibUuFVBiU65eTBNkR2A+7NmjG/JtXosPI+JYQVNfFCGINs5jgeWATAAsZk8DBvAzbGP8
         Cak5+Nzu7fM9rad3XujZw34DKf4EWn7/PouNj8hFNIsb4N2uUUaUA9q6gO/peYxlPI78
         LTBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758160003; x=1758764803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ztic0itTb092Cg8phgOMtBzjG5miAwDaU95tKvoCG9o=;
        b=dwMk6Rkxa2Q0+wP3f9DBpxvEym46KbJCrHnauNDK4hpFkLKtzBaQ2BRPkAJFGRR22O
         lWH4hCvR1i9esZLKM8B15rxYeFrqKNZ534d+rowvkniru2zehqCfxn/mXDWdRc6wE1qf
         mdzSSw6uONJ9fjCaOo0ieRYdAq751BDWv5nxAZEdHxGwej571EfxpPLyTPufR2RzVZAM
         EDErM/bwsid0Xjkpj8kBMkouv+rdUWXIcqNHZ5dfzvHQBSOub8jRUCrPywhfIMFDSZzw
         UhKoFdjHIdZY84k+7jiLO2o6BS9Myby5fkdpNrwcu6tnYvxP0tUBq7eFz5lAC7xO1img
         9Gvw==
X-Gm-Message-State: AOJu0YyM2H7W8B/bklMTvRm5RXjGrHqWtmibJmZ+c8P4RIh4Hy9Mo4GT
	sSiUTScjSJg6iM1JYMKh7tCxaNl9uRFloIUaYNSZD47vRyOHtEtVyxsra8pQ7KIftOaQrW2lDrg
	BuduphBcZ1wDoKTwUejZyqYdJ+yXfqIM=
X-Gm-Gg: ASbGncu4PcPgSWBzZ4r42uK+zkGC+HI3rs+S1WNxKvhklhVtDmA9G99zLra1L6TyM1v
	7gdVzYhDlp5cPXnqY1zAoIa0wEXM2YC7bAhZc59CxJ/r+qPIs0ZoWeEvxq77eSTS5M/OG0Y8Fdw
	9VD3OhApddepOrCmBl9g+3kcgba03A5wa8bMe85CusBbFelW997O1br7OG+0x3GNrqGtLPF1D2m
	g0uWjrwqX6CdAFBTACuXNOueg==
X-Google-Smtp-Source: AGHT+IEoShjhtx9jFDawsjFMigqup5ul3VPAlqdVHAkcLniGQ0utQpaOOKabV6yB8aQ4BG4JD2NxCioJ3jgbCw7hSWM=
X-Received: by 2002:a05:6902:4a0e:b0:ea5:af77:e48e with SMTP id
 3f1490d57ef6-ea5c034f6d6mr3244542276.3.1758160003479; Wed, 17 Sep 2025
 18:46:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250917045026.601848-1-masami256@gmail.com> <34b16512-b098-470a-afff-bc8321e2499a@web.de>
In-Reply-To: <34b16512-b098-470a-afff-bc8321e2499a@web.de>
From: Masami Ichikawa <masami256@gmail.com>
Date: Thu, 18 Sep 2025 10:46:32 +0900
X-Gm-Features: AS18NWCQDzJTwegu8k4De9r1ttP9WvpSRtNldMNb7nT_bgORV0G8wPu0xNyaVTk
Message-ID: <CACOXgS-VN6CDZE2NMtM0TuoRT1UZD1LR0JbY5XOQ6vsVmsTUKw@mail.gmail.com>
Subject: Re: [PATCH] HID: hid-ntrig: Fix potential memory leak in ntrig_report_version()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Minjong Kim <minbell.kim@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the review.

On Wed, Sep 17, 2025 at 4:46=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> =E2=80=A6
> > It is safe to move the kmalloc() call after the hid_is_usb() check to a=
void
> > unnecessary allocation and potential memory leak.
>
> * See also:
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/submitting-patches.rst?h=3Dv6.17-rc6#n94
>
> * How do you think about to increase the application of scope-based resou=
rce management?
>   https://elixir.bootlin.com/linux/v6.17-rc6/source/include/linux/slab.h#=
L476
>

I think using the DEFINE_FREE macro simplifies cleanup, especially
when an error occurs.

> * Can a summary phrase like =E2=80=9CPrevent memory leak in ntrig_report_=
version()=E2=80=9D
>   be nicer?
>

I see. I will rewrite commit log.

>
> Regards,
> Markus


Regards,
--=20
Masami Ichikawa

