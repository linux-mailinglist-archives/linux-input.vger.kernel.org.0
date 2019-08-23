Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2574B9ADAA
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2019 12:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392581AbfHWKvm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Aug 2019 06:51:42 -0400
Received: from mail-out.m-online.net ([212.18.0.10]:57794 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730991AbfHWKvl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Aug 2019 06:51:41 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 46FJ9l2qlDz1rGRc;
        Fri, 23 Aug 2019 12:51:39 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 46FJ9l2TjCz1qqkV;
        Fri, 23 Aug 2019 12:51:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id funYEpq1XLjl; Fri, 23 Aug 2019 12:51:38 +0200 (CEST)
X-Auth-Info: STQJys8Qs0uQp8jPsYNHRNPU6hiQQiJ6TDsRYhTz6+w=
Received: from [IPv6:::1] (unknown [195.140.253.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Fri, 23 Aug 2019 12:51:38 +0200 (CEST)
Subject: Re: [PATCH] Input: ili210x - switch to using threaded IRQ
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
References: <20190811161104.GA43556@dtor-ws>
From:   Marek Vasut <marex@denx.de>
Message-ID: <1bee0866-d022-2adf-3734-aeb2689d28f1@denx.de>
Date:   Fri, 23 Aug 2019 12:34:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190811161104.GA43556@dtor-ws>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 8/11/19 6:11 PM, Dmitry Torokhov wrote:
> Let's switch the driver to using threaded IRQ so that we do not need to
> manage the interrupt and work separately, and we do not acknowledge
> interrupt until we finished handling it completely.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

On ILI2117
Tested-by: Marek Vasut <marex@denx.de>
