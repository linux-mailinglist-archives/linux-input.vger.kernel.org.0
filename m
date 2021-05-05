Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B249D373B1B
	for <lists+linux-input@lfdr.de>; Wed,  5 May 2021 14:25:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233233AbhEEM0I (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 May 2021 08:26:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:57134 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233237AbhEEM0H (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 May 2021 08:26:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F21B3613BA;
        Wed,  5 May 2021 12:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620217511;
        bh=C5LYBRRyhiEzCX//ZToyZztdG94uLTLCIvwvDijWmZ8=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=anE0HHb6nenV8RxA7oCmq8fok7HKuOXivAyJ5/PXs3GUhM016pKnWvrHsnk3TS+Yr
         iDm2+DLR6T2N5ZnPnaYu4GtMpFIU0hCois4GO7wJavTkPA6Xk9YXqWE3ezji+NC7xj
         aRizk3QGkq98NMpW58zFVaSC98g9ZdlXx7VWb/PT9az+ZESWvdCB5vpOwmBP8ZsAvj
         h50dijykhBfngSKoyRJUOCXnoYJRPZDPgVs6TMxvq+GlQXcjZWrVQSVwJNRlnN24pY
         MG7pk5fieTcv45A2KNOUJnuAUtJ+zWyHkjz1nubo7Jo4wFVGiTmVxLmr+Ib+LnYBun
         eiXqjDtSReTlw==
Date:   Wed, 5 May 2021 14:25:07 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: do not use down_interruptible() when unbinding
 devices
In-Reply-To: <YFVBZCrmzvNJQstT@google.com>
Message-ID: <nycvar.YFH.7.76.2105051424590.28378@cbobk.fhfr.pm>
References: <YFVBZCrmzvNJQstT@google.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 19 Mar 2021, Dmitry Torokhov wrote:

> Action of unbinding driver from a device is not cancellable and should not
> fail, and driver core does not pay attention to the result of "remove"
> method, therefore using down_interruptible() in hid_device_remove() does
> not make sense.

Applied, thanks Dmitry.

-- 
Jiri Kosina
SUSE Labs

