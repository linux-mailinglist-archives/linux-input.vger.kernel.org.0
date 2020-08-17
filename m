Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84E582463E1
	for <lists+linux-input@lfdr.de>; Mon, 17 Aug 2020 12:00:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726367AbgHQKAf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Aug 2020 06:00:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:43204 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726366AbgHQKAf (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Aug 2020 06:00:35 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 48C6D20578;
        Mon, 17 Aug 2020 10:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597658435;
        bh=UvjMs/LDtCCJ/BMi3hkCGMOF/7acc+ei0fdIIkTPo/c=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=ZaCKIyP4nwSVgfuRxofhdU1R9xwk4XNhsOtLvAfZO1doHgrPO3yqe5jRIF0IsFdlt
         jOztO9/EbKUVriUGX0Th0Fp9sRHV44rS0Ak1QGy3W+8X5Qy9ofc91FyQUvEdibWr6j
         mt78hrYnXJ0hQeIfZTzSH1K6kR2ogiZyp2pR4388=
Date:   Mon, 17 Aug 2020 12:00:32 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Eudean Sun <eudean@arista.com>,
        =?ISO-8859-15?Q?S=E9bastien_Szymanski?= 
        <sebastien.szymanski@armadeus.com>
Subject: Re: [PATCH] HID: cp2112: Use irqchip template
In-Reply-To: <20200722075632.57962-1-linus.walleij@linaro.org>
Message-ID: <nycvar.YFH.7.76.2008171200230.27422@cbobk.fhfr.pm>
References: <20200722075632.57962-1-linus.walleij@linaro.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 22 Jul 2020, Linus Walleij wrote:

> This makes the driver use the irqchip template to assign
> properties to the gpio_irq_chip instead of using the
> explicit calls to gpiochip_irqchip_add(). The irqchip is
> instead added while adding the gpiochip.
> 
> Cc: Eudean Sun <eudean@arista.com>
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Cc: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

