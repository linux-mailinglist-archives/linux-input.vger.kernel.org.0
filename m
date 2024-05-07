Return-Path: <linux-input+bounces-3567-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C19508BEB37
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 20:11:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B589B21533
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 18:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F22616D33D;
	Tue,  7 May 2024 18:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h85SyUrq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D727E16F90E
	for <linux-input@vger.kernel.org>; Tue,  7 May 2024 18:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715105269; cv=none; b=lc8zBJccjKxtXGeJ0o9CXGp+Ai/pMLoYWfwhJX6eXOFuj1zM/FQ4SEZe28b96O/a8giYqFqXAOL/tdAgVD9+NtkyMyu2vKcTsLCVAFGuWWh4TxxR0IA2y+CQCmtE3FBlLQfNvQzLEwx8j1xKZHZ3777KovW1e0YAhrRa56jtWvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715105269; c=relaxed/simple;
	bh=bLW73SWEgeMqyDRAxtysi0RYiSkCi+nfbXJMo5mjc+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UxeXsHl7mHnnnT6vK2glFDueq3fzLa2BrCLwEcuY54BBg1uQ9NjrfrubHhEaGHKWWLA1tGvJA904fOO3qVrssSsEOn/CLjwYMFI8GF9VZkmHtY1lDM2OEkNKCvnBzPwK0S0J8Kpwvg1Uiv6FARWqqLwHyMJpB9VdCje5s9C45Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h85SyUrq; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3c9741777f0so706645b6e.0
        for <linux-input@vger.kernel.org>; Tue, 07 May 2024 11:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715105267; x=1715710067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLW73SWEgeMqyDRAxtysi0RYiSkCi+nfbXJMo5mjc+E=;
        b=h85SyUrqEqLFeUnAhMpBixmPU6rZXY0elihyHiwVJac3A8KZQxbNGd5M9YGsyXjAMq
         bVw3nnjxueHWrkPmhRLmt83tzWGue4M+3BlFr/iq3htffsgut1tzsYd4fJU4jnK3udR8
         +RsL/jBZOAnA+OPhBG887x2oLTTErvAoWgbekEt60mFTiooEMNoOcE++/tlywqiVfGC0
         BDXPYzMBU4HLhC5HelPyx58UnAixB/GSX1IUqi5cGJchyqo2CZDoCR34syQXhciW3f0k
         yCnkqgiH9IWmJ7TpBr64peEWNHGQezc/bXonKg5JoxOd5Z1VaJuHbWCNeN04AjT6pYFq
         kxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715105267; x=1715710067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bLW73SWEgeMqyDRAxtysi0RYiSkCi+nfbXJMo5mjc+E=;
        b=Yap6IoRArMXZi8/F9tmqkATKo+7/ueIjZ7HVkP2g+H+b5lYS1VhERcG1oapxYbCBZU
         1JCBqQycELbqyTteq1/jeQ7wkVqcmlJ9NEa13JjBzt4HjnxsNkQWUufwFs0GzOCAQwpx
         7jVfljpYDjMI+z9XKtXTVbkWCvW5ZYcEZQvtLtWjT8FXk6h4Ny19uoc4QIc+up9l8Cws
         To36ix/WhWRuvjZlMNTZFLMawxy5gAcMfLe0IyDoEpwIJOQWaRM8ZAZscRy/iB8XgBGl
         Xsx/1irOg5LDGdCi+ytvawMERfBKNOqg5tPrLLzaJiyPhYN0/dtGKKcGwRDme/ZLKLQZ
         tTiA==
X-Forwarded-Encrypted: i=1; AJvYcCX0iDVGAULlqyKl3vvTsrUzdmOB70MKuBWZ3CvzVAOkaEeMnFvK/CpsmOhs1irYx95m7KtUwIEVTh0mt+90QY62ZYUXUgoLXEialUM=
X-Gm-Message-State: AOJu0YyPWz1rFRfTJ+BKd/USPm91JoAGRzsRPapMOiJHQ1V6Kki2YIeA
	9WpfTfAvKneowbHblzPl3ATF1uz0494x4IsmBb5um77cr1KSiNlV
X-Google-Smtp-Source: AGHT+IGmJOYNDRppk7otygMTwHVwc9zinN0DGt0cgj0cciAPGglNp5p9rO2xkeoJ0gNQv7fbDSuzHg==
X-Received: by 2002:a05:6808:11:b0:3c9:68e5:c443 with SMTP id 5614622812f47-3c9852bead7mr323633b6e.19.1715105266886;
        Tue, 07 May 2024 11:07:46 -0700 (PDT)
Received: from mythra.localnet ([2603:6010:d800:cbd::b76])
        by smtp.gmail.com with ESMTPSA id s129-20020a1ff487000000b004daaeb20ab2sm1531613vkh.4.2024.05.07.11.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 11:07:46 -0700 (PDT)
From: Carson <crange76@gmail.com>
To: Milas Robin <milas.robin@live.fr>
Cc: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
 milas.robin@live.fr
Subject: Re: gamecube adapter driver
Date: Tue, 07 May 2024 14:04:30 -0400
Message-ID: <2693037.vuYhMxLoTh@mythra>
In-Reply-To:
 <PA4P189MB146957B28CBD2F35D6479C47FA1C2@PA4P189MB1469.EURP189.PROD.OUTLOOK.COM>
References:
 <4864668.OV4Wx5bFTl@mythra>
 <PA4P189MB146957B28CBD2F35D6479C47FA1C2@PA4P189MB1469.EURP189.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Monday, May 6, 2024 3:32:20=E2=80=AFPM EDT Milas Robin wrote:
> Hi,
>=20
> I don't think so, I didn't received any reply so I guess it is not ?
> If you have some time to review the code I would be grateful.
> As I said in the cover letter (which didn't linked correctly), this is
> my first kernel module so there might be some basic architecture notably
> on race conditions.
>=20
> Also due to the way I've implemented it, if it is build as a module
> it lose priority over the usb-hid generic driver as the device report
> supporting hid it.
>=20
> One other thing which might make the code heavier to read is properly
> detecting if the controller really support rumbles, I actually ignore the
> bit signalling it cause I don't know if the adapter could change it witho=
ut
> unplugging the controller which might lead to have to recreate the device
> to switch it's rumbling capability
>=20
> The patch seems to have no conflict with the current input/next branch.
> If you need a branch I've uploaded it on https://github.com/Hinara/linux.=
git
> The branch is called ngc.

I've built the kernel but it won't boot, its likely a issue with my config =
but=20
could you rebase the patch to a newer kernel. Also I believe we are not=20
contacting the correct person for a merge.

https://github.com/torvalds/linux/blob/master/MAINTAINERS#L15595



