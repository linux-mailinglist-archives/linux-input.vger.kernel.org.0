Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 644F343319E
	for <lists+linux-input@lfdr.de>; Tue, 19 Oct 2021 10:55:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbhJSI5P (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Oct 2021 04:57:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:51708 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234877AbhJSI5O (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Oct 2021 04:57:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3DBE16115A;
        Tue, 19 Oct 2021 08:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634633702;
        bh=ubvup3soEUBcQl7eV9V8O7TK/QXdGy+vE74aXjb0mV8=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=K5wyr5UHHuR26FSVN6iyj1MSfiIRYi8Aw9Mm3d9mxLgziK2xkXpSdW2EZiE6Kjewc
         woEmYaAaXtgZoi3Ri3cFcEM0Nan4e/Dnb84iTpO7T5iDcnPcWD46uJ+i4eiLMGwN1p
         y7pHV//tooQk+oTrRsvS+RTYFvp/Jb7qDR1agRYIsbmfSvNNL90DWE+EiPDsgDRe6M
         Wdyp5lKYoxlWHh222zDc8dExRhqhymK9E13IgofZ6uROnyoytN0DHRsfdzWdb3pJ4H
         C6o5f6kjDMneul+8hU83GRLIE0ZkaFpy2em8x28CtUXI02BPrZKRXcZD10aEhv4sJb
         jYKU/qOGQ86SQ==
Date:   Tue, 19 Oct 2021 10:54:58 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     "Daniel J. Ogorchock" <djogorchock@gmail.com>
cc:     linux-input@vger.kernel.org, thunderbird2k@gmail.com,
        blaws05@gmail.com, benjamin.tissoires@redhat.com,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, pobrn@protonmail.com, lee.jones@linaro.org
Subject: Re: [PATCH v16 00/16] HID: nintendo
In-Reply-To: <20210911173639.5688-1-djogorchock@gmail.com>
Message-ID: <nycvar.YFH.7.76.2110191054080.12554@cbobk.fhfr.pm>
References: <20210911173639.5688-1-djogorchock@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 11 Sep 2021, Daniel J. Ogorchock wrote:

> Rebased onto Linus' tree (sha 926de8c4326c14fcf35f1de142019043597a4fac)
> Depends on Roderick's patch to add the player LED defines:
> https://patchwork.kernel.org/project/linux-input/patch/20210908165539.3102929-3-roderick.colenbrander@sony.com/

I just got Ack for the joydev part from Dmitry.

v16 is now queued in hid.git#for-5.16/nintendo

Thanks,

-- 
Jiri Kosina
SUSE Labs

