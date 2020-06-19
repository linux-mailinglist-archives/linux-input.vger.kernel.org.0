Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95E7A200802
	for <lists+linux-input@lfdr.de>; Fri, 19 Jun 2020 13:41:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732031AbgFSLl0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Jun 2020 07:41:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:49700 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731501AbgFSLlX (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Jun 2020 07:41:23 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 154BC20CC7;
        Fri, 19 Jun 2020 11:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592566882;
        bh=Z6tvAceNFJVrwZ1y/5fk4vzRIyewq0umAq1czzkhS+4=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=zkjfFu/dBc5rUcqsxoQojOMLlnygs097RUEcCTacyzm7q3pVaTJV86pNnGvM8Zpzt
         cvgb8wjO4CAbOQHV/1pJdurMDSAFsmvtcXxoNHi5vDuXvhIR8wcxMV1oMz2tpyAZ9T
         cDPRBLFDEuvG0ukYoOiW36iY889npQDRzWQaVjtQ=
Date:   Fri, 19 Jun 2020 13:41:19 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     David Herrmann <dh.herrmann@gmail.com>
cc:     Daniel Morse <dmorse@speedfox.co.uk>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Subject: Re: [PATCH v3] HID: Wiimote: Treat the d-pad as an analogue stick
In-Reply-To: <CANq1E4RK_QymZwTB_PORc20K9QaJ=Tonuj7_RJQUj-xvqdjH8g@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2006191340260.13242@cbobk.fhfr.pm>
References: <CANFaMLHQwNf3GnPYAxR-ryrYmO-wVmsEHijzVHEYozUt0EzDJw@mail.gmail.com> <nycvar.YFH.7.76.2006190924380.13242@cbobk.fhfr.pm> <CANq1E4RK_QymZwTB_PORc20K9QaJ=Tonuj7_RJQUj-xvqdjH8g@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 19 Jun 2020, David Herrmann wrote:

> > CCing David Hermann in case he has any review comments to this.
> >
> > Thanks.
> 
> Yes, all good!
> 
> Reviewed-by: David Herrmann <dh.herrmann@gmail.com>
> 
> (You want me to send an adjustment for `MAINTAINERS` to link to my new
> email-address/name? Got married some time ago already, but forgot to
> adjust the `MAINTAINERS` file.)

Ah, I wasn't aware that the two of you are the same person :-) Yes, if you 
could do that, it'd be helpful.

Also, Daniel, the patch is unfortunately still whitespace-corrupted and 
line-wrapper, so I can't apply it. Could you please fix that up and 
resend?

Thanks,

-- 
Jiri Kosina
SUSE Labs

