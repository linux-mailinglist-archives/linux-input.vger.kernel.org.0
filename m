Return-Path: <linux-input+bounces-825-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B598168DE
	for <lists+linux-input@lfdr.de>; Mon, 18 Dec 2023 09:55:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 792A11F21867
	for <lists+linux-input@lfdr.de>; Mon, 18 Dec 2023 08:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D24F10945;
	Mon, 18 Dec 2023 08:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VAfi6goM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384DB10959
	for <linux-input@vger.kernel.org>; Mon, 18 Dec 2023 08:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a233bf14cafso127849066b.2
        for <linux-input@vger.kernel.org>; Mon, 18 Dec 2023 00:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702889751; x=1703494551; darn=vger.kernel.org;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kFBQ/10wtaKL+8m10BxYrHbjlRlg8Q+PUaAuMUkYRWY=;
        b=VAfi6goMelWK08bT5Th7i+u+mgjaBRscuE3aPl2r1QrK7yZ2iTNL5ZNSWXBgOVt5r2
         /DS9vS/6Sm/jIZ8H2DqoO+HRsFog3zVzLEFIGQ09P3TrTMcey9baNBaahEl9QLSBaZvx
         FAD+OW+32BTbBUSMzR1tAkhlXJy7nraQLuY3c+3K7xCBXI8dEp2eKSkdY5t7O4THVhAH
         VGMUn1AMs3GZp3EVCiqsNfQKFWJ0Z3/bCY7sJB5vzLJqgtcIlpwSvkBXcJJX0OE3RkWu
         m/Zr02Jj7KyvvEQ2ucgAFxuXCXIf20vdEoCLmspSR/RJp4MuR2/mllgWIe/alolSeUDV
         jPuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702889751; x=1703494551;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFBQ/10wtaKL+8m10BxYrHbjlRlg8Q+PUaAuMUkYRWY=;
        b=V56463q7AdGkz7HLy4SRSQWy0s1GVIGFmRc0K6CVWfcl92uJXq7DCk5WuuEcBCLcJ3
         IdgojQ/nWZnB/O9hjReWhnELlReTZk3DwfCh4wWgvk2r4xxdwUmfHAxReC9t2b5Bovet
         MOwXXB9/0W4BKFbumuF+DLWl9pggujCMIsqMSBgezMfJVu9LAhmZFSdSwbYZl/RM+Sje
         rnGC08CUIjfP5Fmffy8uO4CT5yYNuFz5lqjv4FNVCPWCOgAhZx3IiPV78jX+ZyPXylVr
         kk7iDE8HXWosQRQop5wE2N2Me3KRBbqqGWgNWlCAiTH83trBcWWk1mn5DmTJP+s0Ni1n
         S6aA==
X-Gm-Message-State: AOJu0Yy+1IClk9cpmeyPHOGfuPvNqu8e5fSYWSdHlgzdFuEWdf5f02ww
	ORbkLoka1klCu6G4LIfWZe+UfY67c+Fh9QD5cYQ=
X-Google-Smtp-Source: AGHT+IGdaDWiUH0CwMnQkddG5d+4BtRQEhrjhNcW6sdESY3tLDSH5IHVJmBaHWt9KenF3gsBJ5e70w==
X-Received: by 2002:a17:906:ce4e:b0:a23:2cc9:3bde with SMTP id se14-20020a170906ce4e00b00a232cc93bdemr1457395ejb.22.1702889751502;
        Mon, 18 Dec 2023 00:55:51 -0800 (PST)
Received: from localhost (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id rf19-20020a1709076a1300b00a1f75d21bf3sm13129570ejc.6.2023.12.18.00.55.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Dec 2023 00:55:51 -0800 (PST)
From: Jiri Kosina <jkosina@suse.com>
X-Google-Original-From: Jiri Kosina <jikos@kernel.org>
Date: Mon, 18 Dec 2023 09:55:52 +0100 (CET)
To: Ryan McClelland <rymcclel@gmail.com>
cc: lkp@intel.com, linux-input@vger.kernel.org, linux-mm@kvack.org, 
    oe-kbuild-all@lists.linux.dev, djogorchock@gmail.com, 
    benjamin.tissoires@redhat.com
Subject: Re: [PATCH] HID: nintendo: fix initializer element is not constant
 error
In-Reply-To: <20231214172541.48370-1-rymcclel@gmail.com>
Message-ID: <nycvar.YFH.7.76.2312180955430.24250@cbobk.fhfr.pm>
References: <202312141227.C2h1IzfI-lkp@intel.com> <20231214172541.48370-1-rymcclel@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 14 Dec 2023, Ryan McClelland wrote:

> With gcc-7 builds, an error happens with the controller button values being
> defined as const. Change to a define.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202312141227.C2h1IzfI-lkp@intel.com/
> 
> Signed-off-by: Ryan McClelland <rymcclel@gmail.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


