Return-Path: <linux-input+bounces-13761-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAA4B188C5
	for <lists+linux-input@lfdr.de>; Fri,  1 Aug 2025 23:31:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85D6A3A7693
	for <lists+linux-input@lfdr.de>; Fri,  1 Aug 2025 21:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D839228DEF0;
	Fri,  1 Aug 2025 21:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1CsOvilh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7420274059
	for <linux-input@vger.kernel.org>; Fri,  1 Aug 2025 21:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754083873; cv=none; b=jBYGxsnab/7PGONz6q4O70Go9p5JczuiL4s3iYIHke2VeDfnMo/E+ZTmPePjZk92fMh+xoN3OohYyG9/NuGtilx3ENXvslXeXypNh1WqtweABFhOJamWjAK/6+kcTzm6HINQb1xGfE/De0CQYf06aJEioxHrEaz8P83Gf+/f4PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754083873; c=relaxed/simple;
	bh=rDmRBe2jSUzS9GrUo/EBS5Ra6ndYf8UAIzhX0sIz2u8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rS90QhIl/xtYCd7Z2Nhc+6pzNQB/xpCl4gNMG9q4ivdsoQhVYvYktA7nDzATS7Wm34x6v1P8m77wT4a0spNE7YqLO48KtIjEuOguZeFDV14tmw/E4dBoK5eTsN7X1/Sou6a2V1i1M2BQ/N3pgFTEvsntNl8kBFltlHZGXPs0Id0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1CsOvilh; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-70767eef931so21190636d6.3
        for <linux-input@vger.kernel.org>; Fri, 01 Aug 2025 14:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754083870; x=1754688670; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/7JzvGfwHz+itssOFHoIOwgYd5OJUilza0SmVhPEzI=;
        b=1CsOvilhUsagj2VqROplehDX3fGnWrMa3RpAfm9/Xj4AqMQKyka7BFvuuyTcS78daz
         uXEzVfWuymxkYQnQGokaXLDc5CoWsNUkbF13UPlbAWleOe31WA+x8MOLw/NoL9IrEvPH
         Uus6yrnxuYgL6gLaiomKz8N4OqHlhIeVjjlycN/wlc1dIvTpKGg8OQW9ooL3ztEnSY6W
         wheIYe6Ok0W8Gm6oBfV/pzdHXxGTbTRM2al5/znpSrXLXSalVhsMx2sqYvCVVh9CXZmM
         h06FP2td8lNxadg2in+L+E0OmtZcgBJzKhr6Oeyh1MdfcppGBhEFGmhg27GXBUqM3Edq
         8epA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754083870; x=1754688670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2/7JzvGfwHz+itssOFHoIOwgYd5OJUilza0SmVhPEzI=;
        b=dldMSARDKPBrH1e91tJda4hlxCEk+mWjdSfyJG4DurqHAP7CrRblacTBUFp6obA0Pu
         p7Pvi+alqw++JSXdS1hc/lDXyzkQbK0s4KD39u+RN+C0pFdrHUMySGvKfsTzKhsPaAaN
         OO3PDs8zzvWsUR/lQp7ZGp6Pm7E79DJ8dyrbm5u0D9rgR0sr8+7PNudmefVv3w9SCgTA
         XRA1ixlAX0+lCBzAyd3dsUHSIY6Qm0p3e8wpiY/dt6R+KP54yY9oPM9e2WfyXuA1TKmN
         JkRzQt6y6tii3/RaaPcWlPJoGKg5hDAPDUqCoqqoqT3aGm+psmbBqUzpaddAPjYnVKFO
         4fYw==
X-Forwarded-Encrypted: i=1; AJvYcCVNTKUj+ZIsHioMHr6qQWOIGVe3rCUMIC7cbvjUS3axYL20B4so5w7JmUAF+c9/r9cnWuZWwFTtDY27ow==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLoGnz9ovWhYczWnVAtOPL2mVMz3JjXrsfh9+wM1JiJ4ktgtjZ
	KVcUdkd0gfUvXaZr//TDzzuEwULMR67VQxPQtnhwSxWkYm0zzdKV+OIWwTHd2qFZkzZGh5fzUlj
	vdtqzGTWnx1R/G4P1i+HiikkNp3hzl2RRVb4VqZUP
X-Gm-Gg: ASbGnct57/vfv2V6NYc9D5KDc9HUEISpQSwfoFpnM07WtWwNXEUQEbkKGr83PCPF1au
	7EPJo4tHOknHScRS53vFcv3+JAO3qbGrkNldC0Rl9FLd39hpChEKTQmapoF3oIz0gjeGk9HSe46
	D25NQB9DaBdhKypi2WPLSePBLeKpG6e8ciFJsWS4D4TUULmUegXKptHacbY/RkQafpTGMnDasJF
	8TcClqoKFXTpFP0sxuyW9gQOSHzkkQW/IIOdqCcmdfn6VjhQ34=
X-Google-Smtp-Source: AGHT+IGq3OEWEOw8g068ugBnYeIFEeQ24RSjWdDQ6DmK/9fc5zMrOlsV9XPe12baT9g9zjTvpmNm+ddvGAG8BZ8moeg=
X-Received: by 2002:a05:6214:19c2:b0:707:494:ec4 with SMTP id
 6a1803df08f44-7093670d9d4mr18595976d6.27.1754083869800; Fri, 01 Aug 2025
 14:31:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714-support-forcepads-v1-11-71c7c05748c9@google.com>
 <202507151942.94dhYylY-lkp@intel.com> <CAMCVhVNYePCuCw_SSTxwAdcastPP_azik44kG18o0_QK37OiZA@mail.gmail.com>
 <aHmOZiQ7TAQ3TjpQ@rli9-mobl> <CAMCVhVNTWKg89MhPJeVvKK5ZhXYy2WCJFBGJo2Hg5=aCUZz32A@mail.gmail.com>
 <aIrbJy7Rb6aVNOk9@xsang-OptiPlex-9020>
In-Reply-To: <aIrbJy7Rb6aVNOk9@xsang-OptiPlex-9020>
From: Jonathan Denose <jdenose@google.com>
Date: Fri, 1 Aug 2025 16:30:58 -0500
X-Gm-Features: Ac12FXyab0lrMTFLFGuVNXNCY4TipKwI7kXVrrlKXznk_rhcWE_Or4t5SI91s3A
Message-ID: <CAMCVhVM4fbtAAVReSBJ7noGOjp+MO94kbrwQXs-zWvcHWCmwFw@mail.gmail.com>
Subject: Re: [PATCH 11/11] HID: multitouch: add haptic multitouch support
To: Oliver Sang <oliver.sang@intel.com>
Cc: Philip Li <philip.li@intel.com>, kernel test robot <lkp@intel.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Henrik Rydberg <rydberg@bitmath.org>, oe-kbuild-all@lists.linux.dev, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	"Sean O'Brien" <seobrien@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2025 at 9:55=E2=80=AFPM Oliver Sang <oliver.sang@intel.com>=
 wrote:
>
> hi, Jonathan,
>
> On Mon, Jul 21, 2025 at 11:06:33AM -0500, Jonathan Denose wrote:
> > On Thu, Jul 17, 2025 at 6:59=E2=80=AFPM Philip Li <philip.li@intel.com>=
 wrote:
> > >
> > > On Thu, Jul 17, 2025 at 01:43:28PM -0500, Jonathan Denose wrote:
> > > > On Tue, Jul 15, 2025 at 6:36=E2=80=AFAM kernel test robot <lkp@inte=
l.com> wrote:
> > > > > kernel test robot noticed the following build errors:
> > > > >
> > > > > [auto build test ERROR on 86731a2a651e58953fc949573895f2fa6d45684=
1]
> > > > >
> > > > > url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-D=
enose/HID-add-haptics-page-defines/20250714-231444
> > > > > base:   86731a2a651e58953fc949573895f2fa6d456841
> > > > > patch link:    https://lore.kernel.org/r/20250714-support-forcepa=
ds-v1-11-71c7c05748c9%40google.com
> > > > > patch subject: [PATCH 11/11] HID: multitouch: add haptic multitou=
ch support
> > > > > config: hexagon-randconfig-r112-20250715 (https://download.01.org=
/0day-ci/archive/20250715/202507151942.94dhYylY-lkp@intel.com/config)
> > > > > compiler: clang version 17.0.6 (https://github.com/llvm/llvm-proj=
ect 6009708b4367171ccdbf4b5905cb6a803753fe18)
> > > > > reproduce: (https://download.01.org/0day-ci/archive/20250715/2025=
07151942.94dhYylY-lkp@intel.com/reproduce)
> > > >
> > > > I'm having trouble reproducing this build error. I tried following =
the
> > >
> > > Sorry Jonathan, the reproduce step we provide is wrong, would you min=
d to give
> > > a try similar to the steps in [1]? We will resolve the bug as early a=
s possible.
> > >
> > > [1] https://download.01.org/0day-ci/archive/20250717/202507170506.Wzz=
1lR5I-lkp@intel.com/reproduce
> > >
> > > > steps in the linked reproduce file, but when running:
> > > > COMPILER_INSTALL_PATH=3D$HOME/0day ~/lkp-tests/kbuild/make.cross C=
=3D1
> > > > CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__ -fmax-errors=3Dunlimit=
ed
> > > > -fmax-warnings=3Dunlimited' O=3Dbuild_dir ARCH=3Dhexagon olddefconf=
ig
> > > >
> > > > I get the errors:
> > > > 0day/gcc-4.6.1-nolibc/hexagon-linux/bin/hexagon-linux-gcc: unknown =
C compiler
> > > > scripts/Kconfig.include:45: Sorry, this C compiler is not supported=
.
> > > >
> > > > It looks to me like the hexagon-linux-gcc compiler is correctly
> > > > installed at $HOME/0day so I'm not sure what to do from here. Can
> > > > someone please assist me with this?
> > > >
> > > > --
> > > > Jonathan
> > > >
> > Great! Thanks for providing the correct reproduce steps Phillip.
> >
> > I tried them and both of the make.cross steps completed successfully.
> > I am not getting the build errors that the test bot is reporting.
>
> sorry for this. just want to confirm one thing, did you follow below step=
s?
> (the link [1] above is just for example, we need do small modification to
> reproduce the issue in original report, there are 4 diff in below with [1=
],
> (1) use your commit, (2) 'wget' command to get correct config (3) change =
to
> use clang-17, btw, clang-20 can also reproduce the issue (4) change build
> source to 'drivers/hid')
>
> reproduce:
>         git clone https://github.com/intel/lkp-tests.git ~/lkp-tests
>         # https://github.com/intel-lab-lkp/linux/commit/4ccef2fdc95970f67=
857113edb4103d53205ac9c
>         git remote add linux-review https://github.com/intel-lab-lkp/linu=
x
>         git fetch --no-tags linux-review Jonathan-Denose/HID-add-haptics-=
page-defines/20250714-231444
>         git checkout 4ccef2fdc95970f67857113edb4103d53205ac9c
>         # save the config file
>         wget https://download.01.org/0day-ci/archive/20250715/20250715194=
2.94dhYylY-lkp@intel.com/config
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang-17 ~/lkp-test=
s/kbuild/make.cross W=3D1 O=3Dbuild_dir ARCH=3Dhexagon olddefconfig
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang-17 ~/lkp-test=
s/kbuild/make.cross W=3D1 O=3Dbuild_dir ARCH=3Dhexagon SHELL=3D/bin/bash dr=
ivers/hid/
>
>
> I can reproduce the issue with above steps, if you still cannot reproduce=
,
> could you give me your full log? below is mine just FYI (this is for clan=
g-20,
> and I use some different folders but not important)
>
> xsang@xsang-OptiPlex-9020:~/linux$ COMPILER_INSTALL_PATH=3D/home/xsang/cr=
oss-compiler/ COMPILER=3Dclang-20 /home/xsang/lkp-tests/kbuild/make.cross W=
=3D1 O=3Dbuild_dir ARCH=3Dhexagon olddefconfig
> Compiler will be installed in /home/xsang/cross-compiler/
> lftpget -c https://cdn.kernel.org/pub/tools/llvm/files/./llvm-20.1.8-x86_=
64.tar.xz
> /home/xsang/linux
> tar Jxf /home/xsang/cross-compiler//./llvm-20.1.8-x86_64.tar.xz -C /home/=
xsang/cross-compiler/
> PATH=3D/home/xsang/cross-compiler//llvm-20.1.8-x86_64/bin:/home/xsang/.lo=
cal/bin:/home/xsang/bin:/home/xsang/.local/bin:/usr/local/sbin:/usr/local/b=
in:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/hom=
e/xsang/.local/bin
> make --keep-going LLVM=3D1 CROSS_COMPILE=3Dhexagon-linux- --jobs=3D72 KCF=
LAGS=3D -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef W=3D=
1 O=3Dbuild_dir ARCH=3Dhexagon olddefconfig
> make[1]: Entering directory '/home/xsang/linux/build_dir'
>   GEN     Makefile
>   HOSTCC  scripts/basic/fixdep
>   HOSTCC  scripts/kconfig/conf.o
>   HOSTCC  scripts/kconfig/confdata.o
>   HOSTCC  scripts/kconfig/expr.o
>   LEX     scripts/kconfig/lexer.lex.c
>   YACC    scripts/kconfig/parser.tab.[ch]
>   HOSTCC  scripts/kconfig/menu.o
>   HOSTCC  scripts/kconfig/preprocess.o
>   HOSTCC  scripts/kconfig/symbol.o
>   HOSTCC  scripts/kconfig/util.o
>   HOSTCC  scripts/kconfig/lexer.lex.o
>   HOSTCC  scripts/kconfig/parser.tab.o
>   HOSTLD  scripts/kconfig/conf
> #
> # configuration written to .config
> #
> make[1]: Leaving directory '/home/xsang/linux/build_dir'
>
>
> xsang@xsang-OptiPlex-9020:~/linux$ COMPILER_INSTALL_PATH=3D/home/xsang/cr=
oss-compiler/ COMPILER=3Dclang-20 /home/xsang/lkp-tests/kbuild/make.cross W=
=3D1 O=3Dbuild_dir ARCH=3Dhexagon SHELL=3D/bin/bash drivers/hid/
> Compiler will be installed in /home/xsang/cross-compiler/
> PATH=3D/home/xsang/cross-compiler//llvm-20.1.8-x86_64/bin:/home/xsang/.lo=
cal/bin:/home/xsang/bin:/home/xsang/.local/bin:/usr/local/sbin:/usr/local/b=
in:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/hom=
e/xsang/.local/bin
> make --keep-going LLVM=3D1 CROSS_COMPILE=3Dhexagon-linux- --jobs=3D72 KCF=
LAGS=3D -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef W=3D=
1 O=3Dbuild_dir ARCH=3Dhexagon SHELL=3D/bin/bash drivers/hid/
> make[1]: Entering directory '/home/xsang/linux/build_dir'
>   GEN     Makefile
>   GENSEED scripts/basic/randstruct.seed
>   WRAP    arch/hexagon/include/generated/uapi/asm/ucontext.h
>   WRAP    arch/hexagon/include/generated/uapi/asm/auxvec.h
>   WRAP    arch/hexagon/include/generated/uapi/asm/bitsperlong.h
>   WRAP    arch/hexagon/include/generated/uapi/asm/bpf_perf_event.h
>   WRAP    arch/hexagon/include/generated/uapi/asm/errno.h
>   WRAP    arch/hexagon/include/generated/uapi/asm/fcntl.h
>   UPD     include/generated/uapi/linux/version.h
>   WRAP    arch/hexagon/include/generated/uapi/asm/ioctl.h
>   WRAP    arch/hexagon/include/generated/uapi/asm/ipcbuf.h
>   WRAP    arch/hexagon/include/generated/uapi/asm/ioctls.h
>   WRAP    arch/hexagon/include/generated/uapi/asm/mman.h
>   WRAP    arch/hexagon/include/generated/uapi/asm/msgbuf.h
>   WRAP    arch/hexagon/include/generated/uapi/asm/poll.h
>   WRAP    arch/hexagon/include/generated/uapi/asm/posix_types.h
>   WRAP    arch/hexagon/include/generated/uapi/asm/resource.h
>   WRAP    arch/hexagon/include/generated/uapi/asm/sembuf.h
>   WRAP    arch/hexagon/include/generated/uapi/asm/shmbuf.h
>   WRAP    arch/hexagon/include/generated/uapi/asm/siginfo.h
>   WRAP    arch/hexagon/include/generated/uapi/asm/sockios.h
>   WRAP    arch/hexagon/include/generated/uapi/asm/socket.h
>   WRAP    arch/hexagon/include/generated/uapi/asm/stat.h
>   WRAP    arch/hexagon/include/generated/uapi/asm/statfs.h
>   WRAP    arch/hexagon/include/generated/uapi/asm/termbits.h
>   WRAP    arch/hexagon/include/generated/uapi/asm/types.h
>   WRAP    arch/hexagon/include/generated/uapi/asm/termios.h
>   SYSHDR  arch/hexagon/include/generated/uapi/asm/unistd_32.h
>   UPD     include/config/kernel.release
>   UPD     include/generated/compile.h
>   HOSTCC  scripts/dtc/dtc.o
>   HOSTCC  scripts/dtc/flattree.o
>   HOSTCC  scripts/dtc/fstree.o
>   HOSTCC  scripts/dtc/data.o
>   HOSTCC  scripts/dtc/livetree.o
>   HOSTCC  scripts/dtc/treesource.o
>   HOSTCC  scripts/dtc/srcpos.o
>   HOSTCC  scripts/dtc/checks.o
>   HOSTCC  scripts/dtc/util.o
>   LEX     scripts/dtc/dtc-lexer.lex.c
>   YACC    scripts/dtc/dtc-parser.tab.[ch]
>   HOSTCC  scripts/dtc/libfdt/fdt.o
>   HOSTCC  scripts/dtc/libfdt/fdt_ro.o
>   UPD     include/generated/utsrelease.h
>   HOSTCC  scripts/dtc/libfdt/fdt_wip.o
>   HOSTCC  scripts/dtc/libfdt/fdt_sw.o
>   HOSTCC  scripts/dtc/libfdt/fdt_rw.o
>   HOSTCC  scripts/dtc/libfdt/fdt_strerror.o
>   HOSTCC  scripts/dtc/libfdt/fdt_empty_tree.o
>   HOSTCC  scripts/dtc/libfdt/fdt_addresses.o
>   HOSTCC  scripts/dtc/libfdt/fdt_overlay.o
>   HOSTCC  scripts/dtc/fdtoverlay.o
>   WRAP    arch/hexagon/include/generated/asm/extable.h
>   WRAP    arch/hexagon/include/generated/asm/iomap.h
>   WRAP    arch/hexagon/include/generated/asm/kvm_para.h
>   WRAP    arch/hexagon/include/generated/asm/mcs_spinlock.h
>   WRAP    arch/hexagon/include/generated/asm/text-patching.h
>   WRAP    arch/hexagon/include/generated/asm/archrandom.h
>   WRAP    arch/hexagon/include/generated/asm/barrier.h
>   WRAP    arch/hexagon/include/generated/asm/bug.h
>   WRAP    arch/hexagon/include/generated/asm/cfi.h
>   WRAP    arch/hexagon/include/generated/asm/compat.h
>   WRAP    arch/hexagon/include/generated/asm/current.h
>   WRAP    arch/hexagon/include/generated/asm/device.h
>   WRAP    arch/hexagon/include/generated/asm/div64.h
>   WRAP    arch/hexagon/include/generated/asm/dma-mapping.h
>   WRAP    arch/hexagon/include/generated/asm/emergency-restart.h
>   WRAP    arch/hexagon/include/generated/asm/ftrace.h
>   WRAP    arch/hexagon/include/generated/asm/hardirq.h
>   WRAP    arch/hexagon/include/generated/asm/hw_irq.h
>   WRAP    arch/hexagon/include/generated/asm/irq_regs.h
>   WRAP    arch/hexagon/include/generated/asm/irq_work.h
>   WRAP    arch/hexagon/include/generated/asm/kdebug.h
>   WRAP    arch/hexagon/include/generated/asm/kmap_size.h
>   WRAP    arch/hexagon/include/generated/asm/kprobes.h
>   WRAP    arch/hexagon/include/generated/asm/local.h
>   WRAP    arch/hexagon/include/generated/asm/local64.h
>   WRAP    arch/hexagon/include/generated/asm/mmiowb.h
>   WRAP    arch/hexagon/include/generated/asm/module.h
>   WRAP    arch/hexagon/include/generated/asm/module.lds.h
>   WRAP    arch/hexagon/include/generated/asm/msi.h
>   WRAP    arch/hexagon/include/generated/asm/pci.h
>   WRAP    arch/hexagon/include/generated/asm/percpu.h
>   WRAP    arch/hexagon/include/generated/asm/preempt.h
>   WRAP    arch/hexagon/include/generated/asm/rqspinlock.h
>   WRAP    arch/hexagon/include/generated/asm/runtime-const.h
>   WRAP    arch/hexagon/include/generated/asm/rwonce.h
>   WRAP    arch/hexagon/include/generated/asm/sections.h
>   WRAP    arch/hexagon/include/generated/asm/serial.h
>   WRAP    arch/hexagon/include/generated/asm/shmparam.h
>   WRAP    arch/hexagon/include/generated/asm/simd.h
>   WRAP    arch/hexagon/include/generated/asm/softirq_stack.h
>   WRAP    arch/hexagon/include/generated/asm/topology.h
>   WRAP    arch/hexagon/include/generated/asm/trace_clock.h
>   WRAP    arch/hexagon/include/generated/asm/vga.h
>   WRAP    arch/hexagon/include/generated/asm/video.h
>   WRAP    arch/hexagon/include/generated/asm/word-at-a-time.h
>   WRAP    arch/hexagon/include/generated/asm/xor.h
>   SYSTBL  arch/hexagon/include/generated/asm/syscall_table_32.h
>   HOSTCC  scripts/dtc/dtc-lexer.lex.o
>   HOSTCC  scripts/dtc/dtc-parser.tab.o
>   HOSTLD  scripts/dtc/fdtoverlay
>   HOSTLD  scripts/dtc/dtc
>   HOSTCC  scripts/kallsyms
>   HOSTCC  scripts/asn1_compiler
>   HOSTCC  scripts/insert-sys-cert
>   CC      scripts/mod/empty.o
>   HOSTCC  scripts/mod/mk_elfconfig
>   CC      scripts/mod/devicetable-offsets.s
>   UPD     scripts/mod/devicetable-offsets.h
>   MKELF   scripts/mod/elfconfig.h
>   HOSTCC  scripts/mod/modpost.o
>   HOSTCC  scripts/mod/file2alias.o
>   HOSTCC  scripts/mod/sumversion.o
>   HOSTCC  scripts/mod/symsearch.o
>   HOSTLD  scripts/mod/modpost
>   CC      kernel/bounds.s
>   CHKSHA1 ../include/linux/atomic/atomic-arch-fallback.h
>   CHKSHA1 ../include/linux/atomic/atomic-instrumented.h
>   CHKSHA1 ../include/linux/atomic/atomic-long.h
>   UPD     include/generated/timeconst.h
>   UPD     include/generated/bounds.h
>   CC      arch/hexagon/kernel/asm-offsets.s
>   UPD     include/generated/asm-offsets.h
>   CALL    ../scripts/checksyscalls.sh
>   CC      drivers/hid/hid-core.o
>   CC      drivers/hid/hid-input.o
>   CC      drivers/hid/hid-quirks.o
>   CC      drivers/hid/hid-debug.o
>   CC      drivers/hid/hid-haptic.o
>   CC [M]  drivers/hid/usbhid/hid-core.o
>   CC      drivers/hid/hidraw.o
>   CC [M]  drivers/hid/usbhid/hiddev.o
>   CC [M]  drivers/hid/usbhid/hid-pidff.o
>   CC      drivers/hid/hid-a4tech.o
>   CC      drivers/hid/hid-alps.o
>   CC      drivers/hid/hid-apple.o
>   CC      drivers/hid/hid-belkin.o
>   CC      drivers/hid/hid-cherry.o
>   CC      drivers/hid/hid-cmedia.o
>   CC      drivers/hid/hid-cougar.o
>   CC      drivers/hid/hid-ezkey.o
>   CC      drivers/hid/hid-icade.o
>   CC      drivers/hid/hid-ite.o
>   CC      drivers/hid/hid-jabra.o
>   CC      drivers/hid/hid-kensington.o
>   CC      drivers/hid/hid-ortek.o
>   CC      drivers/hid/hid-razer.o
>   CC      drivers/hid/hid-rmi.o
>   CC      drivers/hid/hid-saitek.o
>   CC      drivers/hid/hid-sjoy.o
>   CC      drivers/hid/hid-tivo.o
>   CC      drivers/hid/hid-udraw-ps3.o
>   CC      drivers/hid/hid-led.o
>   CC      drivers/hid/hid-wiimote-core.o
>   CC      drivers/hid/hid-wiimote-modules.o
>   CC      drivers/hid/hid-wiimote-debug.o
>   CC [M]  drivers/hid/uhid.o
>   CC [M]  drivers/hid/hid-generic.o
>   CC [M]  drivers/hid/hid-axff.o
>   CC [M]  drivers/hid/hid-appleir.o
>   CC [M]  drivers/hid/hid-asus.o
>   CC [M]  drivers/hid/hid-aureal.o
>   CC [M]  drivers/hid/hid-betopff.o
>   CC [M]  drivers/hid/hid-bigbenff.o
>   CC [M]  drivers/hid/hid-chicony.o
>   CC [M]  drivers/hid/hid-corsair.o
>   CC [M]  drivers/hid/hid-corsair-void.o
>   CC [M]  drivers/hid/hid-cp2112.o
>   CC [M]  drivers/hid/hid-cypress.o
>   CC [M]  drivers/hid/hid-emsff.o
>   CC [M]  drivers/hid/hid-elan.o
>   CC [M]  drivers/hid/hid-elo.o
>   CC [M]  drivers/hid/hid-gembird.o
>   CC [M]  drivers/hid/hid-gfrm.o
>   CC [M]  drivers/hid/hid-vivaldi-common.o
>   CC [M]  drivers/hid/hid-google-stadiaff.o
>   CC [M]  drivers/hid/hid-vivaldi.o
>   CC [M]  drivers/hid/hid-gt683r.o
>   CC [M]  drivers/hid/hid-gyration.o
>   CC [M]  drivers/hid/hid-holtek-kbd.o
>   CC [M]  drivers/hid/hid-holtek-mouse.o
>   CC [M]  drivers/hid/hid-holtekff.o
>   CC [M]  drivers/hid/hid-kye.o
>   CC [M]  drivers/hid/hid-kysona.o
>   CC [M]  drivers/hid/hid-letsketch.o
>   CC [M]  drivers/hid/hid-macally.o
>   CC [M]  drivers/hid/hid-magicmouse.o
>   CC [M]  drivers/hid/hid-mcp2221.o
>   CC [M]  drivers/hid/hid-megaworld.o
>   CC [M]  drivers/hid/hid-microsoft.o
>   CC [M]  drivers/hid/hid-nintendo.o
>   CC [M]  drivers/hid/hid-nti.o
>   CC [M]  drivers/hid/hid-pl.o
>   CC [M]  drivers/hid/hid-penmount.o
>   CC [M]  drivers/hid/hid-picolcd_core.o
>   CC [M]  drivers/hid/hid-picolcd_fb.o
>   CC [M]  drivers/hid/hid-picolcd_backlight.o
>   CC [M]  drivers/hid/hid-picolcd_leds.o
>   CC [M]  drivers/hid/hid-picolcd_cir.o
>   CC [M]  drivers/hid/hid-picolcd_debugfs.o
> ../drivers/hid/hid-haptic.c:13:6: error: redefinition of 'hid_haptic_feat=
ure_mapping'
>    13 | void hid_haptic_feature_mapping(struct hid_device *hdev,
>       |      ^
> ../drivers/hid/hid-haptic.h:83:6: note: previous definition is here
>    83 | void hid_haptic_feature_mapping(struct hid_device *hdev,
>       |      ^
> ../drivers/hid/hid-haptic.c:51:6: error: redefinition of 'hid_haptic_chec=
k_pressure_unit'
>    51 | bool hid_haptic_check_pressure_unit(struct hid_haptic_device *hap=
tic,
>       |      ^
> ../drivers/hid/hid-haptic.h:89:6: note: previous definition is here
>    89 | bool hid_haptic_check_pressure_unit(struct hid_haptic_device *hap=
tic,
>       |      ^
> ../drivers/hid/hid-haptic.c:65:5: error: redefinition of 'hid_haptic_inpu=
t_mapping'
>    65 | int hid_haptic_input_mapping(struct hid_device *hdev,
>       |     ^
> ../drivers/hid/hid-haptic.h:95:5: note: previous definition is here
>    95 | int hid_haptic_input_mapping(struct hid_device *hdev,
>       |     ^
> ../drivers/hid/hid-haptic.c:81:5: error: redefinition of 'hid_haptic_inpu=
t_configured'
>    81 | int hid_haptic_input_configured(struct hid_device *hdev,
>       |     ^
> ../drivers/hid/hid-haptic.h:104:5: note: previous definition is here
>   104 | int hid_haptic_input_configured(struct hid_device *hdev,
>       |     ^
> ../drivers/hid/hid-haptic.c:403:5: error: redefinition of 'hid_haptic_ini=
t'
>   403 | int hid_haptic_init(struct hid_device *hdev,
>       |     ^
> ../drivers/hid/hid-haptic.h:114:5: note: previous definition is here
>   114 | int hid_haptic_init(struct  CC [M]  drivers/hid/hid-redragon.o
>  hid_device *hdev, struct hid_haptic_device **haptic_ptr)
>       |     ^
> ../drivers/hid/hid-haptic.c:569:6: error: redefinition of 'hid_haptic_pre=
ssure_reset'
>   569 | void hid_haptic_pressure_reset(struct hid_haptic_device *haptic)
>       |      ^
> ../drivers/hid/hid-haptic.h:126:6: note: previous definition is here
>   126 | void hid_haptic_pressure_reset(struct hid_haptic_device *haptic) =
{}
>       |      ^
> ../drivers/hid/hid-haptic.c:575:6: error: redefinition of 'hid_haptic_pre=
ssure_increase'
>   575 | void hid_haptic_pressure_increase(struct hid_haptic_device *hapti=
c,
>       |      ^
> ../drivers/hid/hid-haptic.h:128:6: note: previous definition is here
>   128 | void hid_haptic_pressure_increase(struct hid_haptic_device *hapti=
c,
>       |   CC [M]  drivers/hid/hid-retrode.o
>      ^
> 7 errors generated.
> make[5]: *** [../scripts/Makefile.build:287: drivers/hid/hid-haptic.o] Er=
ror 1
>   CC [M]  drivers/hid/hid-roccat.o
>   CC [M]  drivers/hid/hid-roccat-common.o
>   CC [M]  drivers/hid/hid-roccat-arvo.o
>   CC [M]  drivers/hid/hid-roccat-isku.o
>   CC [M]  drivers/hid/hid-roccat-kone.o
>   CC [M]  drivers/hid/hid-roccat-koneplus.o
>   CC [M]  drivers/hid/hid-roccat-konepure.o
>   CC [M]  drivers/hid/hid-roccat-kovaplus.o
>   CC [M]  drivers/hid/hid-roccat-lua.o
>   CC [M]  drivers/hid/hid-roccat-pyra.o
>   CC [M]  drivers/hid/hid-roccat-ryos.o
>   CC [M]  drivers/hid/hid-roccat-savu.o
>   CC [M]  drivers/hid/hid-samsung.o
>   CC [M]  drivers/hid/hid-sony.o
>   CC [M]  drivers/hid/hid-steam.o
>   CC [M]  drivers/hid/hid-sunplus.o
>   CC [M]  drivers/hid/hid-gaff.o
>   CC [M]  drivers/hid/hid-tmff.o
>   CC [M]  drivers/hid/hid-thrustmaster.o
>   CC [M]  drivers/hid/hid-uclogic-core.o
>   CC [M]  drivers/hid/hid-uclogic-rdesc.o
>   CC [M]  drivers/hid/hid-uclogic-params.o
>   CC [M]  drivers/hid/hid-xinmo.o
>   CC [M]  drivers/hid/hid-zpff.o
>   CC [M]  drivers/hid/hid-vrc2.o
>   CC [M]  drivers/hid/wacom_sys.o
>   CC [M]  drivers/hid/wacom_wac.o
>   CC [M]  drivers/hid/hid-waltop.o
>   CC [M]  drivers/hid/hid-winwing.o
>   CC [M]  drivers/hid/hid-uclogic-rdesc-test.o
>   LD [M]  drivers/hid/usbhid/usbhid.o
>   LD [M]  drivers/hid/hid-uclogic-test.o
>   LD [M]  drivers/hid/hid-picolcd.o
>   LD [M]  drivers/hid/hid-uclogic.o
>   LD [M]  drivers/hid/wacom.o
> make[5]: Target 'drivers/hid/' not remade because of errors.
> make[4]: *** [../scripts/Makefile.build:554: drivers/hid] Error 2
> make[4]: Target 'drivers/hid/' not remade because of errors.
> make[3]: *** [../scripts/Makefile.build:554: drivers] Error 2
> make[3]: Target 'drivers/hid/' not remade because of errors.
> make[2]: *** [/home/xsang/linux/Makefile:2003: .] Error 2
> make[2]: Target 'drivers/hid/' not remade because of errors.
> make[1]: *** [/home/xsang/linux/Makefile:248: __sub-make] Error 2
> make[1]: Target 'drivers/hid/' not remade because of errors.
> make[1]: Leaving directory '/home/xsang/linux/build_dir'
> make: *** [Makefile:248: __sub-make] Error 2
> make: Target 'drivers/hid/' not remade because of errors.
>
>
>
> > --
> > Jonathan
> >
Hi Oliver,

I think I didn't have the right config so the issue wasn't reproducing
but I'm seeing it now so I'll fix and resubmit.

Thanks!
--=20
Jonathan

