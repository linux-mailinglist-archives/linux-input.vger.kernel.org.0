Return-Path: <linux-input+bounces-1120-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F014E824A4D
	for <lists+linux-input@lfdr.de>; Thu,  4 Jan 2024 22:29:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C9DD281159
	for <lists+linux-input@lfdr.de>; Thu,  4 Jan 2024 21:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F07892C6B2;
	Thu,  4 Jan 2024 21:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="c4exMFG/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2882C6A4
	for <linux-input@vger.kernel.org>; Thu,  4 Jan 2024 21:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-db3fa47c2f7so899829276.0
        for <linux-input@vger.kernel.org>; Thu, 04 Jan 2024 13:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1704403784; x=1705008584; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDcJlzRwgOjmf9s3ju/kHyej59d33XX1hqLumYLyfkE=;
        b=c4exMFG/xhSFs7fVDmdOrQcBL7gKQYzdhiAsSDUhU9joP3gHFbweujXx9/YCv6GusU
         LipRAo6UCn1QJ8FE23VS9o+LjPKcEvoPpBUBXsiLSusU6lWwvIyti5NPNKpluZ/bKa/P
         02ZYh6D29ukCcKQ+pGLHBb5dokanGVaE3CARo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704403784; x=1705008584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bDcJlzRwgOjmf9s3ju/kHyej59d33XX1hqLumYLyfkE=;
        b=ilVwTcxdcMszTJEzr8dIYjR1C2O3itcAiY4PfGBeITtZbDBD3DatOSuuFjilb/rc0G
         CpMOewxZA9LemBPksP2UgKCG3Wgmg2nD9YEy1KPMyQwaboc5exDuDWzH7X/n38OYldjy
         yP54aoX3Jx7vb8RW+HIJUcr6NoySdbdPzBA8o0Fo1nxVwN2g33Ysa3rGFiu2/BjxTu+0
         MtdAxAu/ZXdT05tshXn7/sM9zBaPvX+UcfzIuZwBumhGaCMHOHQ8sujMkolG7X/FgmJO
         P9V5JhSCMruludQRMzePaFVLyxRO3k68/oILaF28RCpF9XCXyqtmHFsvsMRYUO+VL3yF
         flAA==
X-Gm-Message-State: AOJu0YwzFkTFXekZxq7I6Vsdx3TZZDZ3++L01AqzRpkkHaittt5OHElL
	zn0122CIeEK8FLid6cj2X36/mMMg37rEzPfx3LEkGLtoc82g
X-Google-Smtp-Source: AGHT+IFbQEHsVmVAV68hl37UcSvgcgKs002/+LTdYHsauicQGHlQdZcr1LUYTxY2eGVe/gEWwTFmkDgrb6AyHhyhCgE=
X-Received: by 2002:a5b:884:0:b0:dbd:b4c2:728d with SMTP id
 e4-20020a5b0884000000b00dbdb4c2728dmr1116662ybq.112.1704403784286; Thu, 04
 Jan 2024 13:29:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240104050605.1773158-1-zack.rusin@broadcom.com> <202401042305.WdnDeo57-lkp@intel.com>
In-Reply-To: <202401042305.WdnDeo57-lkp@intel.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Thu, 4 Jan 2024 16:29:33 -0500
Message-ID: <CABQX2QMFJ4arXwVNE5YF4pRHqkzVb-rjyqWwSOtrQ_+QLPLV9w@mail.gmail.com>
Subject: Re: [PATCH v2] input/vmmouse: Fix device name copies
To: kernel test robot <lkp@intel.com>
Cc: linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Raul Rangel <rrangel@chromium.org>, 
	linux-input@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 4, 2024 at 11:04=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Zack,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on dtor-input/next]
> [also build test ERROR on dtor-input/for-linus linus/master v6.7-rc8 next=
-20240104]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Zack-Rusin/input-v=
mmouse-Fix-device-name-copies/20240104-130724
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git ne=
xt
> patch link:    https://lore.kernel.org/r/20240104050605.1773158-1-zack.ru=
sin%40broadcom.com
> patch subject: [PATCH v2] input/vmmouse: Fix device name copies
> config: i386-buildonly-randconfig-001-20240104 (https://download.01.org/0=
day-ci/archive/20240104/202401042305.WdnDeo57-lkp@intel.com/config)
> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240104/202401042305.WdnDeo57-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401042305.WdnDeo57-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> drivers/input/mouse/vmmouse.c:77:7: error: variably modified 'phys' at=
 file scope
>      char phys[sizeof_field(struct serio, phys) +
>           ^~~~

This can be trivially fixed by using __builtin_strlen which with
fortify-strings.h is used anyway but before respining this I'll wait
to hear if this approach is ok. The sparse warning we can't do much
about because it doesn't recognize the fact that the array size is a
compile time expression.

z

