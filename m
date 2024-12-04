Return-Path: <linux-input+bounces-8384-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DAA9E3691
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2024 10:29:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 530F31692F5
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2024 09:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B9252F9E;
	Wed,  4 Dec 2024 09:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FbQivxXs"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FDC19D09F;
	Wed,  4 Dec 2024 09:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733304542; cv=none; b=CfXnJm/4jsnk0tsMaL/a6ZOOE0SrdfOB29ncZzVrSUb2Mbls3ftgAT+qgIbHRV1wOOTWlxhJOvkluMpFYesj9pnDKFhSZg54Wo1FePoiWuu6bCctrtus3GXhrTKbxMofZt3VjDHrhe5xI1o1D+g4Y/emAnWJX/bcBBF//tDEMzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733304542; c=relaxed/simple;
	bh=ueBFVBbNKfTAft/cYLpMvLh9qEuyzUvOzL0BfZofqKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S3o/DujPggxnDUoeBoaE8I8wXr06hSMsoaZJavduey/hjqs7TjBkybYrIeBK5+MiTaZWQUKaM3x497oDjyXfd+q/qNl7/RD0w2NL9kd1EBZvGDGmwQ9/53RcpP3qc0CTriQdiS9oEM2rkKhvLrHSCCo3KULVtO7QpRE98+MXn5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FbQivxXs; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e388503c0d7so4848302276.0;
        Wed, 04 Dec 2024 01:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733304539; x=1733909339; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pHrIZaLEeFmzu5KQ0LKYc7lzyVxc78OLSyYQ7PV95dk=;
        b=FbQivxXsXw4+Joi5Ql4CyYPhcSBTLouy4B98cCHgSd72H/GBRG0vAFkwKj/cAIpP3p
         SRfRfTUksIhTAgnBkpS/NveiS3oiZreEJYs8D+Fn6MlClGjg2pEE3VN7ov53at7SkfRq
         u5JUEjabjanQeIftQVfGKoDnmWpQXcD7v2Q6KRz5Eb77R1CnOTEiwq2zzbY1ZwQ+UxIn
         PNtswruC72hn53HbJcxHuWtxO7z9M8fYh2DaMqdYcSAmumn8w5ZqcF3eFQdlJtFO9sNG
         15W1m6IHEb+VqBAyxCZo88CEdruNQVxYcvgUwMc3cDAGmTsfHGtvSV3SMtMK3I9uj2SC
         8JvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733304539; x=1733909339;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pHrIZaLEeFmzu5KQ0LKYc7lzyVxc78OLSyYQ7PV95dk=;
        b=A5uCFFNmlhzMjHo3HaTmzUSVqkrpvJzlglNv8tVhQaatLL/4FRKmpA7jCyHonf4qD9
         8qpR5+47dBiMVft+KO4MenzCsUeMiwNZry3fFp6wgHhGReILsk0+/fVjhgZhemihpSFV
         61BSzxod8vJS+YTVK6Gn48vCzYhANrxXkkOu3cPn85MhrXJz7+7kz/6p/8B+kuMcnQ+J
         UrtJtg+/gGzz8HFpKBnoIf5d+9mNy3uKBvCuFIfYbVu7Y4R0mSb39IdUFtEJiQkWL66V
         P4lrDceWNdq68C74SNNNkJ6Mlc1cLkBYOHGsrz9zRyThlpg5d/OddaEDGyMLb/t7UaI+
         1LrQ==
X-Forwarded-Encrypted: i=1; AJvYcCV37N1dB7GLTrKbQQ3sg8iYQDw/KjZ7WVGlgcYyMoULG9P0QGlA3l/GQ/fFu2TQk0w38iIbWHxGeMoH@vger.kernel.org, AJvYcCVbEARcs1ZWRd8CjQqRNAbo21NkTwRxhXkoQj3UhAe/lti3duovAgx5jlyOC/nbxzU9/hK/qFzzCBhAOkDM@vger.kernel.org, AJvYcCXYrk9KiqVW1vMjGuUH7D/nLYJAWZSzwqRab0zvhS8ZwHBU+jWTOu6vq5sKgBkIXPs+n5rdXQPv4+siOKM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd9zZJvq9AQa4YKT7Et97GP2ojKrixsynP3mxwhzfL+k3CLGYJ
	N+n8yg52eUtuCopQft+/7mRDHeD7N0OqA4ZHVApcu5ytnm33xpBXgMFeDJYx2s5pnkAtv/6icq0
	zS6f0OXgsvHe9hIZDJ4JZ9c/9FQE=
X-Gm-Gg: ASbGncsdHbcP03pkkU4N5iEEK6/rnLDsqFMPwlrsWVjKm3TfWtdm44KerM/r1s6RHdx
	K52ma0AXsK8f/TLJCJmipOoRL93DBvyil
X-Google-Smtp-Source: AGHT+IHmiUq5JaZBzDl7/VKOgdhADM9Ii0ineCplj6K99/74ASpMyAFGBPqR+m4ORzqcODkAuKrJN0c0KPHOQNpBbMg=
X-Received: by 2002:a05:6902:2d91:b0:e30:cea9:b071 with SMTP id
 3f1490d57ef6-e39d3e20f00mr4260700276.29.1733304539556; Wed, 04 Dec 2024
 01:28:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241128-z2-v2-0-76cc59bbf117@gmail.com> <20241128-z2-v2-2-76cc59bbf117@gmail.com>
 <Z0-PRapfiAUGvr4W@google.com>
In-Reply-To: <Z0-PRapfiAUGvr4W@google.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 4 Dec 2024 10:28:48 +0100
Message-ID: <CAMT+MTQ3M1gfz5aLWd17R-RODJi-wnxKJvf9zoX+TjoZMKjCKA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] input: apple_z2: Add a driver for Apple Z2 touchscreens
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Dec 2024 at 00:07, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> > +     z2->counter = 1 - z2->counter;
>
> Is this toggling between 1 and 0? Should it be "counter = !counter"? And
> is there better name than counter?

message_index_parity? Kind of a mouthful.

> > +     .remove   = apple_z2_shutdown,
>
> Purring the device into reset state before tearing down interrupt
> handler, etc, may lead to weird errors. Why do you need to do this on
> removal instead of letting devm tear down the device?

The interrupt is masked before putting the device into reset,
and i do need to put it into reset when removing it.

