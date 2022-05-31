Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFCF7538D42
	for <lists+linux-input@lfdr.de>; Tue, 31 May 2022 10:54:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238245AbiEaIy1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 May 2022 04:54:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233830AbiEaIy0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 May 2022 04:54:26 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D70D08FFB5
        for <linux-input@vger.kernel.org>; Tue, 31 May 2022 01:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=qGow7MgUBq/l0vPG8dNroaog9E3YynIEC2soOLsJJNU=; b=KQgr24xk7xl1+J3U69w7IvEpQm
        IO3pryeiiYGzpsV9MKjuHl5f/iXmUJ4MZ4wTqXQ2RW80xkk+suy3rqMQNPCYmvYspZEB9tHsrOvss
        TgVyu+4W/E6kexjYhGPpzBkEfU9fXewdrJfmp/L5/1Y98w97VNq4kUfa3660AO53h3fQFecPPRoeg
        V8PYiNZ5eAAOALG5uC/u5oICkP7roofH69dlpXaZwnRpAQSNPWdTx5liKK435FScp6YLgKq93WMns
        EnJUC8R4viRupei4OqUCiEp475321rn2ykcB/U/NJywdXUcDu/905DCyrw1dZXRaMA7xp6BYOjvkm
        75oejttA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=worktop.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nvxdt-005C2y-L4; Tue, 31 May 2022 08:54:21 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
        id 00A38980DCA; Tue, 31 May 2022 10:54:19 +0200 (CEST)
Date:   Tue, 31 May 2022 10:54:19 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: Suspend/Resume (S3) issues with rmi_smbus
Message-ID: <YpXXu2tbCSCUtUYQ@worktop.programming.kicks-ass.net>
References: <YpSExunpPdgdjQCz@worktop.programming.kicks-ass.net>
 <YpUX3EAzpL4+xgu1@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YpUX3EAzpL4+xgu1@google.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, May 30, 2022 at 12:15:40PM -0700, Dmitry Torokhov wrote:

> Can you check the entire list of resume operations to make sure that
> PS/2 device is resumed before RMI one?

It reports psmouse failure *after* the rmi4 failure. Is there a knob to
make it print more device model details on resume?

> You can also try overriding devices driven by rmi_smbus as needing
> synchronous resume (see
> https://lore.kernel.org/all/YgHTYrODoo2ou49J@google.com/).

I can confirm this works.
