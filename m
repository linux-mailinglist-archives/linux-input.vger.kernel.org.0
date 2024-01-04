Return-Path: <linux-input+bounces-1116-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AC0824873
	for <lists+linux-input@lfdr.de>; Thu,  4 Jan 2024 19:56:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E20CCB20E27
	for <lists+linux-input@lfdr.de>; Thu,  4 Jan 2024 18:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9454328E21;
	Thu,  4 Jan 2024 18:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uk/acuN9"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5466728E1C
	for <linux-input@vger.kernel.org>; Thu,  4 Jan 2024 18:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d408c2908cso4281385ad.1
        for <linux-input@vger.kernel.org>; Thu, 04 Jan 2024 10:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704394589; x=1704999389; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ehVI5M1jOeHRKnKBP4i8iYB1jD4ghq03/b4KuG7s0zw=;
        b=Uk/acuN90yDptaWJQL5BBqE7/mi/N9mvtcgSSsFnewkvzfJcxXJM4cpk9mkzp3zoY6
         BqGsbpqiBKwc/8JlOwmWyqlfPnUgSxBd4T/Cvlsve6Be0DM/HXHrMwHwOhAp5iy0Qzrw
         YvY1xhBnMedyrwM+wwqHiEUsM2B4RslwCwMHB++4VB0CkbbZcB+VndvPxZNv27MwvjjT
         CFocwFJOv+ZoFTX0jeK7iGOy5N9WekWRfHZ8cNYZ14baYigf0ZgAsRYsSDDOFK9Wp+Nn
         qIJ8UKWCAvKmo5W+AiLMQgwszJNgpoM5EYn9nZCQksJ1R/5nFkiPOK5caERpE72N4Lz0
         KU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704394589; x=1704999389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehVI5M1jOeHRKnKBP4i8iYB1jD4ghq03/b4KuG7s0zw=;
        b=QywqpclG+YQgnVDzbY4EQpI4n5YKPjW61GL/kWaZbuqhn9kuxPgVgT1K9yps8x+iN1
         i0duHzOyeY7ra0nB384UmGXd9KM8fYhDWzrO9pA0APX2uCySdv/l689Tl2MwFIjj0x48
         wP8DObLMO0amigMdurjlST9ciBlnTzRh8wMi1rX+4MCywXaO8DcLrx1BawjIrsYpmdtu
         Qc/T+O4rcWYXVwk7rR5g7MV9lf6GNRCoAJ68+nSXKS15Zb2iCL4H7PmvG0qPkm8Pa1yS
         j6xdITRhF6WTb0Z4iA+9FyW2O6DFcMSrfiUqoQvz4oAx4DFUKe7IQEp8gW0h//AtLhzc
         pJmw==
X-Gm-Message-State: AOJu0YwR7lliq/B/jkffUNT99nTsvE1BQQ+PGpH7zu2RnFjUSEpuzaMt
	lECFmOu2E3xk+kqA47u2Sro=
X-Google-Smtp-Source: AGHT+IGc+gSIEIOU9SdGEaBjiMBu5cHg690LSWGRE0S/STR5e3FyRjghXXtPs7YMhh1nVf6uLNyWwg==
X-Received: by 2002:a17:902:e84c:b0:1d0:c0d3:5c1 with SMTP id t12-20020a170902e84c00b001d0c0d305c1mr1089590plg.102.1704394589369;
        Thu, 04 Jan 2024 10:56:29 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:1f9:ed78:2bc9:6dbd])
        by smtp.gmail.com with ESMTPSA id u1-20020a170902e5c100b001cf658f20ecsm25790661plf.96.2024.01.04.10.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 10:56:29 -0800 (PST)
Date: Thu, 4 Jan 2024 10:56:26 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bernhard Seibold <mail@bernhard-seibold.de>
Cc: linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Hans de Goede <hdegoede@redhat.com>, Jamie Lentin <jm@lentin.co.uk>
Subject: Re: Re: [PATCH 1/3] HID: input - Add microphone mute LED support
Message-ID: <ZZb_WlilLq_2QdmZ@google.com>
References: <20240104154941.6919-1-mail@bernhard-seibold.de>
 <ZZbxHpibdyNY_zUt@google.com>
 <fm6z2zok4ndbke3zqvrm7zbmkukul65n5unl5xkgmlccswz3hl@ycpnx2ii5wu4>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fm6z2zok4ndbke3zqvrm7zbmkukul65n5unl5xkgmlccswz3hl@ycpnx2ii5wu4>

On Thu, Jan 04, 2024 at 07:46:32PM +0100, Bernhard Seibold wrote:
> Hi Dmitri,
> 
> On Thu, Jan 04, 2024 at 09:55:42AM -0800, Dmitry Torokhov wrote:
> > No, please do not add new LEDs to input subsystem, and instead use "new"
> > LED APIs that are much more flexible. That is why we built the input
> > leds bridge in direction of input->leds and on the other way around.
> > 
> > The existing input LED definitions are grandfathered because they are
> > exposed to userspace (via evdev), but we will not be adding new ones.
> > 
> > Thanks.
> 
> Sorry, I'm completely new to this subsystem. Did I get it right that
> what you're suggesting is to add something that is similar to
> hidinput_setup_battery() and create the new LED there directly,
> skipping the input subsystem and input-leds completely?

Yes, exactly.

Thanks.

-- 
Dmitry

