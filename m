Return-Path: <linux-input+bounces-5221-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6C194225B
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 23:52:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FAC41C22862
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 21:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2841318DF7D;
	Tue, 30 Jul 2024 21:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CqUSy0oh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FC31AA3EF;
	Tue, 30 Jul 2024 21:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722376327; cv=none; b=aqQFnJWaxXMlLqROKisenFHN4MFWQq4nTK9Q9uZcQPvH7wSGJu3NtCQ1GxscWsd/5gvttFgz8eqQYP/U/hFjaXgcCrUhtUvJ0EP3dzU6NM0vATyHz5yNx7hB3hlyZwnPdB9zkBVXpVEfJ6luv0BGBCcGum4+kd06Cl3vF0S8UiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722376327; c=relaxed/simple;
	bh=r+/t776wfptyMgQPV+jTmvewv0X2sh2LkP01/p+yUME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tPp9vng3/9A9Mb0p/WSaP0d8RKHUT28k9z4KQSr1cMPcvpTSet4WLvOheZQuoQvmdUfg53xJ4LCF6b1Vuy0hKR+3i4qzqm4MmTN5GevCF4i4FObX1d9DhfnwYuAPB9o3FaiDFTNFMGnoxNMOnu/TecsXvjF9iPKrlBK3PAGLUdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CqUSy0oh; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1fc658b6b2eso38189305ad.0;
        Tue, 30 Jul 2024 14:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722376325; x=1722981125; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kYszYXYrlwu+uOLnHhI4UbP7oKXpR+rcs0bdkRNRrGM=;
        b=CqUSy0oh0kRtBmxw1qmsVDdm+vLuz2QRCCDdHAELEC1OrvW+E6WnLwYU1PC/Jlrr0u
         FdTsjsuCCPxoCXvirM7Tt++D7ODMRmQtfarOOrDQjpR+cF1UduvsWj7RNKEUXypA1nnu
         ztQz0dFwSlHqCeHBUx+ciQ7lzFb8iJQZrlg50dMmV/9hLYFuTI0Ens4gIl8I7m2xs4uy
         q/uvKdVzviUvCdH7RKhI1ucP4ECicv0lbQFHRIvzkGrvhxOM4wcIjb7Gp2/bGIQnUuPD
         2b1TxuZeSu43UuB9jpqZMDxDlQO7Dkb6U1xEivW87TM8FqWoWbdRCrU7yJKqtp8tyPuo
         e04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722376325; x=1722981125;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kYszYXYrlwu+uOLnHhI4UbP7oKXpR+rcs0bdkRNRrGM=;
        b=Y8xIiNWtGQlkYIleElfuzGDl7E+dYfyPDU3JVoJVC+Rb6ivTZS3quq5p3bxFRSlmHV
         UogFW8f+RbSw0EQI5rjXVjclP/6VuV1AcFZbP53CKUwIgJRJb4O2xA9qzxzdmCWZ6dfg
         W7DNQ/qE893hHOcZC8bbm9MaI9KDD6ptBDuDBk4PTYxkI1h3ETBj9R8Sy3xj5DTIsfIv
         P+2LabfIYNpICRXbFMUTS0YaalDzvDr702C+7zhcdN+Bf5MEUiY+NuyDF2RI9AWyglzL
         8ps/gy2eNflgll7awUaQ/64CGiiLHf/ZkU5RZxhD6jdcx82WBk0m5IzUlz1s5oYlK6tv
         r1Kw==
X-Forwarded-Encrypted: i=1; AJvYcCXMu4WKygG0mJ8eU/Obk/dzN90oTfD1wD8ywo5fJvMjQup0VRs78LtTVRZI2wFvgFgVGmm5qAr43EzQWMthnreSqXAP7VPov2EOBB94NvrL4F+tm3Wv4qiknY5Y65Ebovhui/V3KnIvXB4=
X-Gm-Message-State: AOJu0YxmxFlfLjW80ef4MRe2mhJ04S5Ey0ZJaeGXQTsrcQ1xsh7H3+iD
	JBcv3ARhzJTQbd+KKKXxbQJEXHxqcZw02ArNfXC3qCrCG9B/gl7zNHrRWg==
X-Google-Smtp-Source: AGHT+IEX1MtzR7BDZmOe1b49i7WGYSAIz53+ircuy/jKfZ6YPIzz5djRQF6jqb+kSJx4+B5+abnMXg==
X-Received: by 2002:a17:902:e885:b0:1fb:9b91:d7c9 with SMTP id d9443c01a7336-1ff047e4399mr133941565ad.4.1722376324897;
        Tue, 30 Jul 2024 14:52:04 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1d80:5c93:e030:d766])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7c88a67sm107067085ad.11.2024.07.30.14.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 14:52:04 -0700 (PDT)
Date: Tue, 30 Jul 2024 14:52:01 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Henrik Rydberg <rydberg@bitmath.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH (resend)] Input: MT - limit max slots
Message-ID: <ZqlggV3G0t743exX@google.com>
References: <a7eb34e0-28cf-4e18-b642-ea8d7959f0c7@I-love.SAKURA.ne.jp>
 <2024072944-appraisal-panning-a0b1@gregkh>
 <f9b4ff23-ee3e-418f-b65d-c40fe28fbba8@I-love.SAKURA.ne.jp>
 <2024072930-badge-trilogy-c041@gregkh>
 <Zqe76gATYUcDVLaG@google.com>
 <CAHk-=wgweFg4hOus9rhDEa437kpkdV88cvmOHeZWwhgSa5ia1g@mail.gmail.com>
 <ZqfYfIp3n7Qfo1-Q@google.com>
 <3ace9a7f-159f-4c61-807a-c0d9be996986@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ace9a7f-159f-4c61-807a-c0d9be996986@I-love.SAKURA.ne.jp>

Hi Tetsuo,

On Tue, Jul 30, 2024 at 02:38:19PM +0900, Tetsuo Handa wrote:
> On 2024/07/30 2:59, Dmitry Torokhov wrote:
> > Please do not. Or you will have to patch it again when we will still see
> > the same allocation failures because someone requested an input device
> > with "too many" slots (1024 results in 4Mb mt->red table for example).
> > 
> > Just fix malloc/syzkaller not to trigger on benign memory allocation
> > hickups. They are normal.
> 
> I chose 1024 because as far as I know 4MB is max acceptable size for
> all environments without triggering too large allocation warning.
> 
> You worry about mt->red, but did you notice that syzbot was reporting that
> memory allocation for mt->red has an integer overflow bug, which can cause
> out of bounds write or ZERO_SIZE_PTR pointer dereference bug at input_mt_set_matrix() ?
> 
> https://lkml.kernel.org/r/6d878e01-6c2f-8766-2578-c95030442369@I-love.SAKURA.ne.jp

I'll happily take the change converting that to array_size().

> 
> Lucky thing is that the uinput interface is for only the "root" user...

uinput also does not request in-kernel contact tracking so it will not
allow hitting that overflow.

Thanks.

-- 
Dmitry

