Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA937EFCA1
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2019 12:46:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730784AbfKELqX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 Nov 2019 06:46:23 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:50685 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730876AbfKELqW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 5 Nov 2019 06:46:22 -0500
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1iRxHx-0003vY-HE; Tue, 05 Nov 2019 12:46:21 +0100
Message-ID: <cddf7fedf4287a2510728a13c9b71dd446ba4de4.camel@pengutronix.de>
Subject: Re: [PATCH resend 2/3] Input: synaptics-rmi4 - add dummy F54
 attention handler
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, patchwork-lst@pengutronix.de,
        kernel@pengutronix.de
Date:   Tue, 05 Nov 2019 12:46:21 +0100
In-Reply-To: <20191105000359.GS57214@dtor-ws>
References: <20191104114454.10500-1-l.stach@pengutronix.de>
         <20191104114454.10500-2-l.stach@pengutronix.de>
         <20191105000359.GS57214@dtor-ws>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Mo, 2019-11-04 at 16:03 -0800, Dmitry Torokhov wrote:
> On Mon, Nov 04, 2019 at 12:44:53PM +0100, Lucas Stach wrote:
> > F54 is IRQ capable, even if it is not used in the current driver
> > implementation. The common driver code in rmi_create_function_irq always
> > installs a irq handler for functions that are IRQ capable. Without a
> > assigned attention handler, this means a NULL pointer being passed as
> > the nested IRQ handler. This seems to work with some architecture
> > implementations, but crashes on others like ARM64.
> > 
> > Don't rely on implementation defined behavior and actually install
> > a proper attention handler.
> 
> Instead of supplying dummy IRQ handler, can't we simply disable relevant
> interrupts bits?

Don't know why I didn't try this last time. I vaguely remember that not
enabling the IRQs didn't help.
I just retested and it seems the IRQs are enabled by default, so we
need to actively disable them. I just sent out a patch which does
exactly this.

Regards,
Lucas

