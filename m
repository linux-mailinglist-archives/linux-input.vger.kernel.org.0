Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06FD9373B39
	for <lists+linux-input@lfdr.de>; Wed,  5 May 2021 14:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231633AbhEEMbT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 May 2021 08:31:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:36966 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232144AbhEEMbS (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 May 2021 08:31:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 47E8D613B3;
        Wed,  5 May 2021 12:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620217822;
        bh=vsuyRUh/qyAm0gdbH4V9YAP+0xz3dUwTdkckuf5eyP8=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=pk7ObtvA3DAU06w2srSzKTwQaIcVWvBJLMSCscf8nFnNfhjMQa5yca3j/njCr2W73
         0+120NveanCvnahilGDY92ydC5sTEeLTn/l6crtuNA+aw7us9pwKqSRHQEYNKlg2GS
         LaVi0UvHn7+FoHLzM2aSqnswGYVPUjBUGXxCN2fS8+8y2+PTwbRd3iaqoxL1RigMKN
         tqzIk5/8zD36NEr+QyzRJr5nTtet4+oLC5kb4RqiV6nB82++Iwe4CiGdlAOjOuJLGp
         RgtX20QtmZP606Y4eNB7BUn6R5dFeDZvtHsDXXslscGtyKoBQaNExhKb/7X8hIN0qY
         lxWWgziDi1Dpw==
Date:   Wed, 5 May 2021 14:30:19 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-2?Q?Mateusz_Jo=F1czyk?= <mat.jonczyk@o2.pl>
cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH resend] hid-a4tech: use A4_2WHEEL_MOUSE_HACK_B8 for A4TECH
 NB-95
In-Reply-To: <20210406182538.34347-1-mat.jonczyk@o2.pl>
Message-ID: <nycvar.YFH.7.76.2105051429520.28378@cbobk.fhfr.pm>
References: <20210327125329.40357-1-mat.jonczyk@o2.pl> <20210406182538.34347-1-mat.jonczyk@o2.pl>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 6 Apr 2021, Mateusz Jończyk wrote:

> This mouse has a horizontal wheel that requires special handling.
> Without this patch, the horizontal wheel acts like a vertical wheel.
> 
> In the output of `hidrd-convert` for this mouse, there is a
> `Usage (B8h)` field. It corresponds to a byte in packets sent by the
> device that specifies which wheel generated an input event.
> 
> The name "A4TECH" is spelled in all capitals on the company website.
> 
> Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
> Cc: Jiri Kosina <jikos@kernel.org>
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Now applied to hid.git#for-5.13/upstream-fixes. Thanks,

-- 
Jiri Kosina
SUSE Labs

