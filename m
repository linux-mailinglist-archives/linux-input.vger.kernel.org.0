Return-Path: <linux-input+bounces-15698-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CA5C063FA
	for <lists+linux-input@lfdr.de>; Fri, 24 Oct 2025 14:27:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC7A93AA5F5
	for <lists+linux-input@lfdr.de>; Fri, 24 Oct 2025 12:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13BA6302148;
	Fri, 24 Oct 2025 12:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XqLCIXr3"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFD730F555;
	Fri, 24 Oct 2025 12:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761308827; cv=none; b=Tm4JkhJuo71x0imicL4uyHkN/JAe8h/PQ3oH8gkbPJo8Fflhte8dPYMzBw6YG1KpeM6JCp5uuGOtkOKcLsMMUk93UorbhJIRuTrQFTCQtBEZFyJao+sRdwFOPGxXgg4S5G9HA+YYUQn0ty9Q7ZZbSvdzCyb06NHisbn20V0aIV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761308827; c=relaxed/simple;
	bh=q4QVXSWimw3lrARQsHqFxEtQp5IC31FvpX2TkHKoBlM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Q5nuktMce9nCUEzHWrq7/Fk8D70xsoMB/Lv5kybB4VyFZOiYvJLv1o6onppIAc7loL0WEvNROVpp09CEyqh1wPdv4oz6qp0vROG9Z+RFJU6urlFhY8ordmXh7GcCP+/ShwAeAEWzEks+816JnHszfGc4IlQTEH4bKKW19KIDqZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XqLCIXr3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF95BC4CEF1;
	Fri, 24 Oct 2025 12:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761308826;
	bh=q4QVXSWimw3lrARQsHqFxEtQp5IC31FvpX2TkHKoBlM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XqLCIXr3CXq0MXv0IQ9Z1rwvqiV526KYggRznKXpfq2hPuVtpd6nud09Z/zr1qYVt
	 fhAwpIkvdGOI5xtz/8iatVDzUmFVL36qzcctOMJUUeTQfIjlxALhIO5r4epo20amc3
	 S/u9MNMFcUYk2BwF41rzfqaS0VTmjnWIHLd0FMAl29IanLorIJ3oZfmvAbTwiXnoqn
	 07J3Aw5suEQHcScYUcpheAmzhxtCxLlHiVxlkjhuu5sn4VV3dGBbcZV6MlMmtIuKYg
	 YjfmjWoAFhfGy6lUv5ZgPoXDre7cGl/ZGApgvJ+IEv7djdPiQ9GmwK0/TpKYmYfxp5
	 aDvdDVaGabp3w==
Date: Fri, 24 Oct 2025 14:27:03 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
cc: Zhang Lixu <lixu.zhang@intel.com>, 
    Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
    llvm@lists.linux.dev, Benjamin Tissoires <bentiss@kernel.org>, 
    Nathan Chancellor <nathan@kernel.org>, 
    Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
    Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v1 1/1] HID: intel-ish-hid: Fix a build error in
 devm_ishtp_alloc_workqueue()
In-Reply-To: <20251024122511.1422492-1-andriy.shevchenko@linux.intel.com>
Message-ID: <3qq2o1r0-q920-3986-q9p5-44p9oorq74qp@xreary.bet>
References: <20251024122511.1422492-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 24 Oct 2025, Andy Shevchenko wrote:

> clang 19 is not happy about the cast and in conjunction with CONFIG_WERROR=y
> (which is default) leads to a build error:
> 
> drivers/hid/intel-ish-hid/ipc/ipc.c:935:36: error: cast from 'void (*)(struct workqueue_struct *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
>   935 |         if (devm_add_action_or_reset(dev, (void (*)(void *))destroy_workqueue,
>       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Fix this by providing an intermediate callback that has a correct type.
> 
> Fixes: 0d30dae38fe0 ("HID: intel-ish-hid: Use dedicated unbound workqueues to prevent resume blocking")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks Andy. Nathan beat you on this one:

	https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?h=for-6.19/intel-ish-v2&id=3644f4411713f52bf231574aa8759e3d8e20b341

-- 
Jiri Kosina
SUSE Labs


