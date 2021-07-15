Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DECE33CAD36
	for <lists+linux-input@lfdr.de>; Thu, 15 Jul 2021 21:53:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239001AbhGOTza (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Jul 2021 15:55:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:45388 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243194AbhGOTxU (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Jul 2021 15:53:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id ACFE661285;
        Thu, 15 Jul 2021 19:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626378624;
        bh=LnmOEh/QmwY08vtH0j+zSWjy+nvRTvi5+WyG+mdXv8M=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=o0gRcmvXS66hw+/DS1S0iu4mdsw+aVi0y2GYS3rFLgtayLS9IYuPsBlhLJ5yomBMv
         jIc+5WsrZQx+wRk8uxwHaftLw1T11L12omRFDGW1t37MXtytpH7zlz3PjMU1XwLDjb
         Oo4wXs+9xoJNxCT3gtFDhX4hv9DYePHMMnRKvWRdZQvZRPqqyRDmJW+i8LFJq8ZKci
         WA+j1M49jzwD+esKcT2c938pbzoIOUYpuPBhCihLLas427PX2v3TfY8MHE1kSmVwGo
         yHQKdmWHUxY8IYRe7QgfQb3RzouIqI+NhdQoZ6Ss/bsfHxq1/8uvW7D8NPJ/4v7y4W
         rL5ZfLReKBbKg==
Date:   Thu, 15 Jul 2021 21:50:21 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Douglas Anderson <dianders@chromium.org>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] HID: i2c-hid: goodix: Tie the reset line to true
 state of the regulator
In-Reply-To: <20210625081818.v2.1.I358cae5e33f742765fd38485d6ddf1a4a978644d@changeid>
Message-ID: <nycvar.YFH.7.76.2107152150060.8253@cbobk.fhfr.pm>
References: <20210625081818.v2.1.I358cae5e33f742765fd38485d6ddf1a4a978644d@changeid>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 25 Jun 2021, Douglas Anderson wrote:

> The regulator for the touchscreen could be:
> * A dedicated regulator just for the touchscreen.
> * A regulator shared with something else in the system.
> * An always-on regulator.
> 
> How we want the "reset" line to behave depends a bit on which of those
> three cases we're in. Currently the code is written with the
> assumption that it has a dedicated regulator, but that's not really
> guaranteed to be the case.
> 
> The problem we run into is that if we leave the touchscreen powered on
> (because someone else is requesting the regulator or it's an always-on
> regulator) and we assert reset then we apparently burn an extra 67 mW
> of power. That's not great.
> 
> Let's instead tie the control of the reset line to the true state of
> the regulator as reported by regulator notifiers. If we have an
> always-on regulator our notifier will never be called. If we have a
> shared regulator then our notifier will be called when the touchscreen
> is truly turned on or truly turned off.
> 
> Using notifiers like this nicely handles all the cases without
> resorting to hacks like pretending that there is no "reset" GPIO if we
> have an always-on regulator.
> 
> NOTE: if the regulator is on a shared line it's still possible that
> things could be a little off. Specifically, this case is not handled
> even after this patch:
> 1. Suspend goodix (send "sleep", goodix stops requesting regulator on)
> 2. Other regulator user turns off (regulator fully turns off).
> 3. Goodix driver gets notified and asserts reset.
> 4. Other regulator user turns on.
> 5. Goodix driver gets notified and deasserts reset.
> 6. Nobody resumes goodix.
> 
> With that set of steps we'll have reset deasserted but we will have
> lost the results of the I2C_HID_PWR_SLEEP from the suspend path. That
> means we might be in higher power than we could be even if the goodix
> driver thinks things are suspended. Presumably, however, we're still
> in better shape than if we were asserting "reset" the whole time. If
> somehow the above situation is actually affecting someone and we want
> to do better we can deal with it when we have a real use case.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Applied, thanks Doug.

-- 
Jiri Kosina
SUSE Labs

