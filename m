Return-Path: <linux-input+bounces-3973-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 507FD8D567A
	for <lists+linux-input@lfdr.de>; Fri, 31 May 2024 01:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CD782874EC
	for <lists+linux-input@lfdr.de>; Thu, 30 May 2024 23:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2064D5674D;
	Thu, 30 May 2024 23:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zq9+fhxY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58DF55896
	for <linux-input@vger.kernel.org>; Thu, 30 May 2024 23:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717112939; cv=none; b=pjjn2bbdz8nKY/kss/s6AqA5f8bf50Rngy4hxLncv+qZUWHgNganKBMmEeV2Otbani+Pw9X7UgWtTuYEb8OGh28E6szyX4EbACzlEFjr9pPf5RM+Bh26w/xvAUUY/vXY5B3Krj9spgumvovvX/wLbU6rqrkP31IBNW+tKQsaNcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717112939; c=relaxed/simple;
	bh=Nc5OEocp7HvnJna9q1Co97QtXrw3jMCiFDp0trCC+y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sGeApMmtI0MQ2LPjriSPBdVsyPq4iu5+ApILaQAtHz4CCNdSR+8TcvH3J/UjFNBtTj5TSoINBWyygq9R5FeIpzmabJL+zJd0g7R3OwmJBtFQ0au1SfSPmjJAhvrFbXr1DgfzD/SIPSBElT3qv5hObZ+gkVOsxc4A5ep4svsHLDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zq9+fhxY; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7022c8418d9so1379455b3a.1
        for <linux-input@vger.kernel.org>; Thu, 30 May 2024 16:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717112937; x=1717717737; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zf5aPZ+wJljUGhok2mEiEc1VKOcWM3/UwnHlxakZz0c=;
        b=Zq9+fhxY1n91kRVKIYefcJpk3HUOIw57+xJymNeG0NzG1QfrtFBziUKktOgLtILSF4
         jEvDSxqMGgpcz0qr0zeRsv2B8x+chmL2ynVcUfhIf4djr/bZpDD3ze+kY3/X9OFFbPzz
         atjV0nqBJO7/xLpqApNg3rfGgjF2hAsuk1NHuoHkcA8Zb+uWh+TSRFbDlX1bUA/4M7rN
         li9rA9Yg60KCnATdPfEkZDSCG4MV0RHZwXy8nXFIASLfYjSCsXbBDe4aLXorDMTMSYOl
         NqjpYDInIgOe5fN3WDKfUhrnwEZ6YSPRsWv5u6zu1XymzSOIB2v8bgPUywYxThI8cSOD
         s9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717112937; x=1717717737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zf5aPZ+wJljUGhok2mEiEc1VKOcWM3/UwnHlxakZz0c=;
        b=Sp+LCuBKXZtaGvEfOaj0Ui8wHZzYcAwn43PiMgoZ4XHvPzr6RT3z/ajnD4plOIky9I
         RiovwvkUA0OCLQJknztKE7fNZtz48EutV2XMVGACWzqs8xCnLjoRy/4ippt/IrOK2Xuj
         RKitIOinVWqIH7M7WKJW9XfyYoKiVeebPByB+9RJbohkYqfagFuPA0ZWiXeVFeTfvw21
         u019OU41kChXJXdSe7tXPxwicwGvmwWXCbR6+tnBJ/4k3P0rV6Lt2HAPoxbMfg162aXY
         0CS8D/OS+l89UN++H5qLAnVap1uFKyqvUXBHqxu5uyVejy9L0DyCLP9wdLdmvL0OsYj3
         b+9A==
X-Forwarded-Encrypted: i=1; AJvYcCVMRvU3XNmzKUtFa+t2jkl0sOgwvSssLZrc+KeaqSyFBz1gnRezXktG86ptb7DSvWJzqNtW7f5IJnYh1fyGR/8FfATI/om4o/aXH58=
X-Gm-Message-State: AOJu0YyV3Q7rgQnaHDmBTondyFgmLmERoZ0SmuaKCvabXUDMRRwWt8A6
	g+5SP4oht7n8vnjO7mELS02BKOWVLd6Ps9TbfeIZmCHi8vBXwORq
X-Google-Smtp-Source: AGHT+IFopOHW8j7Zvdtd0VhFod0zvOXXgBTzAac0itNKZPbLOTvkVUgtMAva2trhCuPKf37gCdD/pg==
X-Received: by 2002:a05:6a20:3206:b0:1b0:1025:2e3 with SMTP id adf61e73a8af0-1b26f2b12e0mr426911637.57.1717112936804;
        Thu, 30 May 2024 16:48:56 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:509f:4b2e:3586:eb1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7024898c3e5sm67899b3a.108.2024.05.30.16.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 16:48:56 -0700 (PDT)
Date: Thu, 30 May 2024 16:48:54 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jason Gerecke <killertofu@gmail.com>
Cc: Ping Cheng <pinglinux@gmail.com>, linux-input@vger.kernel.org,
	Aaron Armstrong Skomra <skomra@gmail.com>,
	Joshua Dickens <joshua.dickens@wacom.com>,
	Joshua Dickens <Joshua@joshua-dickens.com>
Subject: Re: [PATCH] Input: wacom_w8001: Check for string overflow from
 strscpy calls
Message-ID: <ZlkQZsbDKTkzUfE2@google.com>
References: <20240510234332.139038-1-Joshua@Joshua-Dickens.com>
 <CAF8JNhKKCCwRzUxookmv9VUecT37fR8psoz7uSVBQqDhnYEBgQ@mail.gmail.com>
 <Zkvcs0yg1ltamZPY@google.com>
 <CAF8JNhKqAOvxo3C1SaecaVP0uj4QeYpttybBgq_Jw7n18MLpcA@mail.gmail.com>
 <Zk4qE1ij-0lnxjCT@google.com>
 <CANRwn3SuTjdCCK4YH1ObvsC_gZuythAQ7kSHJP-CiAFw9h5Qcw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANRwn3SuTjdCCK4YH1ObvsC_gZuythAQ7kSHJP-CiAFw9h5Qcw@mail.gmail.com>

On Thu, May 23, 2024 at 09:51:42AM -0700, Jason Gerecke wrote:
> [...] If you don't like the idea of introducing non-actionable
> warnings, would you be open to a small cleanup patch instead (see
> attached as an example)? There's no particularly good reason to split
> string generation across calls to strscpy and strlcat when a single
> call to snprintf would do, and snprintf is not __must_check on any of
> the kernels we backport to.

Yes, I actually like it much better, applied.

Thanks.

-- 
Dmitry

