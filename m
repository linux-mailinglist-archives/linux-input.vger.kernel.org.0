Return-Path: <linux-input+bounces-8276-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EBECE9DA623
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2024 11:49:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97B581641C0
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2024 10:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 279611991CF;
	Wed, 27 Nov 2024 10:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h2nqCOBJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE7F1991A5;
	Wed, 27 Nov 2024 10:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732704561; cv=none; b=KhXwBsn/GWemcVAdD14nBkG4rLzIRgrqyNwwLTH84PCkidPicdKPO3SkdUfaJaMb3aEfbpLYs98nY5UrZ4hO+pX7m4gxNv6lutHZrXwRfs/eLA7vavVmotDE6IU8DRqipvxrLXbpLrxF1U+wZaCKJys8UAyRvSZzwQAOM1onnXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732704561; c=relaxed/simple;
	bh=zj3U1IZYGABL9V0QZyz6/EdJvXQoY7bKYdXQeHobgQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YnnojeiW8zPojrrxjlLpnWo9tW26+HicGwnpergDkAS4QvUJUi0oS3NSfkegdalf1SV/eb2wpl8FKC/hgGsb57WPsgBa4E5GgpERNubMkAxHp4P1r2PCi5+Rq6QFITZUenT3HyA7UhS68yR7Au/BM1fFAlzgYN3S1bhpG2/IziM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h2nqCOBJ; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e2bd7d8aaf8so6286123276.3;
        Wed, 27 Nov 2024 02:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732704557; x=1733309357; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iYyR3yXYjz0YbNKKTg5cy3mGbrW5Do8TFUwFkEGO9kc=;
        b=h2nqCOBJpaMkvI7OFV1ytJoEsA8rEiC5bg3xTa7vZaDom+zBshx0AuUR9Z+yPPAjj2
         wHVl3nFBRUUi5I4GiBmYbH0yvze6tqGHuER0NQkEkKxJ3RMd1JFl/ocRtBLB3kQIKvVl
         1bfm82I23yNxmFWVeb00RF+U5mQaHNOIWupuCZ+p8nqHYLq0RriQ+0qzTV3Edq3f+nl+
         aUEvB6PlWMu05NgwT7MtvtHqT2EctFsd/N0h+gFRWLlj8sOwLeXR9G3Obdn/NQzetNEZ
         JoOFVtzy8I+Yhtp5noEqjh4pnAbRicooTQovvHE9ni4Usjtlg7L5pPkVyiuEQzb+Ao0S
         CKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732704557; x=1733309357;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iYyR3yXYjz0YbNKKTg5cy3mGbrW5Do8TFUwFkEGO9kc=;
        b=ByXRWvNLa2r/4JQXHVfOiyiwv6xybpUqPOzSav4cJMbFx5JHHg1Ondb6dPEOUPLIom
         1CYMbwELzb8xniB69RqjT0X4fmJQletxo42dGUfME3Bbhibp+L/wtOFVNv8Gem1BKn0s
         ayhwiSyzIMRLyrC+Q0qvOoCMV7681yoK0Kl7lVxdqMRqhjDajZrjwRz3+sA2Ke0NhlEZ
         Enlnja+U7u4kn6gwI2FWXvZ3dMfJuoZy1SvnrvUxOIEEVuWWWbA/o/fGr4xZAPX2avFn
         pgDxTbcecC9lAwzBH46Dp7iGWiJS3OYpBjnBuDb9RN7oj5lXWDzHfQcPfI6mbgBzMd8q
         zamg==
X-Forwarded-Encrypted: i=1; AJvYcCUv6/gDkesqome8snR1+lKs9Srl2umgvTk3DVGoxrZw0a454tK3rlRAgMamCOFNVVzGoWfmXdU4ty3NtoA=@vger.kernel.org, AJvYcCVOYuEpPzMqfWaLbVtpbNqFcZ+O0cnBmjR3vIah2AGAaQzk1Ipl/3xv02IiK2Mx9OVB1hxEjbwC1ZTC@vger.kernel.org, AJvYcCW1DCa+UPK7ij81jA1MfW/gDKmZRXOlKgLEEtCCtsI0lErZshZljOuO8EpiZEwtGXwu/WwPrqudR2+Siqh6@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0DZM+TrxYGNwEs2wr57YSrFAISRRs4ip5iCOxvmcgyeN8rWvy
	2RMgCN3O6QjUbnxPMJ1TGdpb0GHXkxfOHH5xGZCXgmu1WM3IAKkkJkuFjGKgE4BDkYGkkQfWT6Z
	69cIvGRTdbgEqxhSUNxdIleYCfyE=
X-Gm-Gg: ASbGncstUpqq/nQgB+S+19z6Z5fFzmIX1J+eGWzBKcc3iIUhaMYtIZDfDDE82H0/5MV
	yckzzDQ9EvjhPYsuc7PDM6dXoQl+fy4bV
X-Google-Smtp-Source: AGHT+IHuUBgbeWipGcuuSeVvP/LgXH+YzaHYRbIiLarVanu1jwlInw1N972fZqN73ZU9w+/mGXihRtV+AM8sbsNIxlo=
X-Received: by 2002:a05:6902:1588:b0:e38:b889:7efb with SMTP id
 3f1490d57ef6-e395b897916mr2246859276.21.1732704557583; Wed, 27 Nov 2024
 02:49:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com> <20241126-z2-v1-1-c43c4cc6200d@gmail.com>
 <zwdpx6c6qxm5674u2sea5sgwdd2fwim4waijb2qvixf62wrshb@yqs6zurtf7ic>
In-Reply-To: <zwdpx6c6qxm5674u2sea5sgwdd2fwim4waijb2qvixf62wrshb@yqs6zurtf7ic>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 27 Nov 2024 11:49:06 +0100
Message-ID: <CAMT+MTR46HbUJWQOwG+MY8OffquekynUs_BRCbuAosLrmc+smQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: input: touchscreen: Add Z2 controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Nov 2024 at 09:47, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> What is the meaning of these two last compatibles in the list? What are
> these devices?

Those are generic compatibles for everything that speaks the Z2 protocol
multitouch is used for everything, as this is currently enough for the driver,
while touchbar is for userspace, as touchscreens and touchbars
need different handling. This specific schema was suggested
on the previous version.


> > +  label:
> > +    maxItems: 1
>
> Why is this needed? I think it is not part of common touchscreen schema.
> Drop, devices do not need labels - node name and unit address identify
> it. If this is needed for something else, then come with generic
> property matching all touchscreens.

I want some sort of a property to contain a human readable (ish)
name of this device.

