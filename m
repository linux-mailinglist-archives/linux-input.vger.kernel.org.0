Return-Path: <linux-input+bounces-6653-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1E69843C2
	for <lists+linux-input@lfdr.de>; Tue, 24 Sep 2024 12:38:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 345B81F22723
	for <lists+linux-input@lfdr.de>; Tue, 24 Sep 2024 10:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44C6019C54C;
	Tue, 24 Sep 2024 10:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bB1+s9h2"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C031219C544;
	Tue, 24 Sep 2024 10:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727174315; cv=none; b=mCtx4/w8a9IegPj+Wv9qwgGrXHevKGXyLSqPnftK0zfP6Pa0z24tchsmdZ4J15GT35iBuB2Q4a2txgJb46Z9v1I2Lw6A153+jXsGfaS8Yc+40++toPh193UZonIa0Ati9FPdI5Xhp9xyB0jzNGBKQR6RrNwIe1XERGhD/Wxeinc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727174315; c=relaxed/simple;
	bh=9rgpQ0ZDA61IQjvzXXV8QvbydpCXmPpLAOqdGolBERY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gHADiHcERTCWVPaZ2PlKVytldK8CZ1gf3DFeq4dT19ea2cNAfcIyqNJ6bEAWkNfxK+xloQXS4uLr17pg1GCdeHlnCfGrBZYLMQq8p/bRZLhP5efc1GYLKnuTG3mgp13SKA0mt5UW0FFtvYIVXqjNJXvr4D3aRAAm+PSMDWQHZHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bB1+s9h2; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2d877e9054eso3708110a91.3;
        Tue, 24 Sep 2024 03:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727174313; x=1727779113; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ssFOFBuC8QZM0sK14vzWhYMrAs7WhfuaB+vk6WWPzbQ=;
        b=bB1+s9h2MAcdrE+BR3YIqGLxEqeg8lqsg2n6kfQoucagOarZZZf7h17TDrcoVckV1T
         6pR/cdT4OR+l/UCpF7GR5da+5+2WZYknr7lRQXw4VQUKCtOo11mETgOFL0Z2GBN7oT/8
         OWrdJQ4HAvaj09nrK5tmNpVDe3+bz8Z0bxEWGI6buBAXGR6TKsCkpIkdWVjyw1tRxSVf
         tFWtSMbv1vqGw2rfa05OFPVDNpKoB5gJYY4EyFYa2GYPrYAUgS3799hWnQxmQhZskRJm
         A9jzLVOoS+TopVgwp4q6wCCKLhQnsAKYU4PwmI+KF5tLnWBeMZcVknAt7t+HayEdWi0l
         M6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727174313; x=1727779113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ssFOFBuC8QZM0sK14vzWhYMrAs7WhfuaB+vk6WWPzbQ=;
        b=UuF6IfJbXli0bSnoUfT7DGse6iC2hxErPkXCRzSx6ppqQU20hpxbVH8KENeMJLtmN9
         GanyF+BPUZ2uhHMo92N0ikHbA+dCJse/rZTdxCEe66zkU+2M/uFTzg0lXHeX4h29+57i
         aNl7vmCsqCdj7eRG/kscRKvGEz+n5YO4wX5wMkjePoKTm2dNZisX9RTEB+Xdxye6gjh1
         nY+QO8nCwLMIGpBKYR+CNZX4PbYJl9uE1oLXKCIAsPmNHAhROhtlsidfzdsSrCkN19Ou
         o+bTJhtOMA2Mq2AJhA21/fs8Tip6bn+G8wVbkmZd19KnLN55N6tYnayWh+tC4RcPq/je
         OvjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVErnK7lKqvRcHRbDemhc6bPFgynYJPQtDfsGxmC9cCiLOMDTdtZ3p1473EI69W1ctE65EYUuQnhF8P/g==@vger.kernel.org, AJvYcCWQIOu2YdbrwUbM5K9u7HBOhEIKyAQuS2ox19Qndk714plQ2cw3dXtTGDGHyUeJDkxECa4Wz/ICD8bicXgq@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5sga7rsWwmia6rtPNtZwttWAVQqV4MFS937CJglOGq842Ih2S
	HaIolV/m8actjT3DP5rMdaILJS1q4Qs32fLkobq8tbe2h8YGy7PAlaRYfAU++WeFMHBtz85W/Bp
	4Jm+wzTJm1R4i6rVa0aOgZRr79nLX2JMu2SI=
X-Google-Smtp-Source: AGHT+IFguKgJVQXFU2c3EhuYsKB59vYMp6YaQbgX3Vpbfe9r77vlHP79liTlX4aW9umb4mFncfhh4NC5pkkPS4eUlVw=
X-Received: by 2002:a17:90b:4f83:b0:2d8:a9af:b94f with SMTP id
 98e67ed59e1d1-2dd7f38133amr18318552a91.7.1727174312844; Tue, 24 Sep 2024
 03:38:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240917100432.10887-1-vishnuocv@gmail.com> <202409211318.ZsE7JGOi-lkp@intel.com>
In-Reply-To: <202409211318.ZsE7JGOi-lkp@intel.com>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Tue, 24 Sep 2024 19:37:49 +0900
Message-ID: <CABxCQKuya7HUWPPw+3vSigddHa84hGZdtuN-02mxvNdfieLXZQ@mail.gmail.com>
Subject: Re: [PATCH] hid: hid-lenovo: Supporting TP-X12-TAB-1/2 Kbd Hotkeys
 using raw events.
To: kernel test robot <lkp@intel.com>
Cc: jikos@kernel.org, bentiss@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev, 
	mpearson-lenovo@squebb.ca, vsankar@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for the inconvenience.
The base I used was the Master branch.

Should I resubmit this patch again with the base as linus/master next-2024x=
xxx?

On Sat, Sep 21, 2024 at 3:19=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Vishnu,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on hid/for-next]
> [also build test ERROR on linus/master next-20240920]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Vishnu-Sankar/hid-=
hid-lenovo-Supporting-TP-X12-TAB-1-2-Kbd-Hotkeys-using-raw-events/20240917-=
180639
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-n=
ext
> patch link:    https://lore.kernel.org/r/20240917100432.10887-1-vishnuocv=
%40gmail.com
> patch subject: [PATCH] hid: hid-lenovo: Supporting TP-X12-TAB-1/2 Kbd Hot=
keys using raw  events.
> config: i386-randconfig-062-20240921 (https://download.01.org/0day-ci/arc=
hive/20240921/202409211318.ZsE7JGOi-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b=
5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240921/202409211318.ZsE7JGOi-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409211318.ZsE7JGOi-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_=
mutex.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governo=
r_powersave.o
> >> ERROR: modpost: "platform_profile_cycle" [drivers/hid/hid-lenovo.ko] u=
ndefined!
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki



--=20

Regards,

      Vishnu Sankar
     +817015150407 (Japan)

