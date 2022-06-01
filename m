Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD794539D54
	for <lists+linux-input@lfdr.de>; Wed,  1 Jun 2022 08:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239265AbiFAGkX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Jun 2022 02:40:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233201AbiFAGkW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Jun 2022 02:40:22 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A3A8954A4
        for <linux-input@vger.kernel.org>; Tue, 31 May 2022 23:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=FMM3+gKMSCn+iHBqQAJbcY2TLanscj3ubi30QyPYXc0=; b=wWOrRLapnMqr8QaaXHuxBC5DWy
        MNS+efVTykYqEqq5L+dfad/bPPe8CKAociZGiCmulJI4WTAPEw8tN1WqeKjw5dqvTnU8io2d0Tbdi
        6C4JiPM8v7oGsmzwcma4q90Kv8P/8Qka7GwcB01Z7EPZqpht48ZnfrAP16b+chuVux+dSZizKTk6C
        WXw8q3M7kFofoMv9Dw5qcrPzQqgUSdcGUaz0Vexke4giDxX4x4i5WONk7O9IgGcAD9X7+oo3CVj6N
        enZoOWMaLiMiWSeb5VMsvLrRYHQlLkfYrBRshJ3H36CuCn6Y8g9/IlskAVa6GafNuJ4+0RgQst5cK
        jvtSHiSg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=worktop.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nwI1h-0063Pm-VB; Wed, 01 Jun 2022 06:40:18 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
        id EAB3398137D; Wed,  1 Jun 2022 08:40:14 +0200 (CEST)
Date:   Wed, 1 Jun 2022 08:40:14 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: Suspend/Resume (S3) issues with rmi_smbus
Message-ID: <YpcJzoa+UP0CB0gK@worktop.programming.kicks-ass.net>
References: <YpSExunpPdgdjQCz@worktop.programming.kicks-ass.net>
 <YpUX3EAzpL4+xgu1@google.com>
 <YpXXu2tbCSCUtUYQ@worktop.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YpXXu2tbCSCUtUYQ@worktop.programming.kicks-ass.net>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, May 31, 2022 at 10:54:20AM +0200, Peter Zijlstra wrote:
> On Mon, May 30, 2022 at 12:15:40PM -0700, Dmitry Torokhov wrote:
> 
> > Can you check the entire list of resume operations to make sure that
> > PS/2 device is resumed before RMI one?
> 
> It reports psmouse failure *after* the rmi4 failure. Is there a knob to
> make it print more device model details on resume?
> 
> > You can also try overriding devices driven by rmi_smbus as needing
> > synchronous resume (see
> > https://lore.kernel.org/all/YgHTYrODoo2ou49J@google.com/).
> 
> I can confirm this works.

I might have spoken too soon; this morning I still had no touchpad :/

Most weird.
