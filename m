Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86B3636169D
	for <lists+linux-input@lfdr.de>; Fri, 16 Apr 2021 01:59:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235291AbhDOX7j (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Apr 2021 19:59:39 -0400
Received: from smtprelay0145.hostedemail.com ([216.40.44.145]:42916 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S234716AbhDOX7j (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Apr 2021 19:59:39 -0400
X-Greylist: delayed 405 seconds by postgrey-1.27 at vger.kernel.org; Thu, 15 Apr 2021 19:59:39 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave05.hostedemail.com (Postfix) with ESMTP id 8336C182BDA10
        for <linux-input@vger.kernel.org>; Thu, 15 Apr 2021 23:52:36 +0000 (UTC)
Received: from omf06.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id 389091808827C;
        Thu, 15 Apr 2021 23:52:30 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf06.hostedemail.com (Postfix) with ESMTPA id 486BD2448BB;
        Thu, 15 Apr 2021 23:52:29 +0000 (UTC)
Message-ID: <82fc2a9a0df1fa6c901645693cca2eab34d5f032.camel@perches.com>
Subject: Re: [PATCH 2/2] Input: evbug - Use 'pr_debug()' instead of
 hand-writing it
From:   Joe Perches <joe@perches.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Date:   Thu, 15 Apr 2021 16:52:27 -0700
In-Reply-To: <5bc599f199df4e43c4a7f02f167af3e897f823dd.1618520227.git.christophe.jaillet@wanadoo.fr>
References: <fda981546203427a0ac86ef47f231239ad18ecfe.1618520227.git.christophe.jaillet@wanadoo.fr>
         <5bc599f199df4e43c4a7f02f167af3e897f823dd.1618520227.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.10
X-Stat-Signature: 3rr1ck6noq6yr1bba6hr6fyqncmzgtx7
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 486BD2448BB
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18L6sZKnhCru4z3Lnm5SnBf8KVcLAjIW4I=
X-HE-Tag: 1618530749-3431
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 2021-04-15 at 22:58 +0200, Christophe JAILLET wrote:
> 'printk(KERN_DEBUG pr_fmt(...))' can be replaced by a much less verbose
> 'pr_debug()'.

This is not really true because
	printk(KERN_DEBUG ...);
will _always_ be emitted if the console level allows
	pr_debug(...);
will _only_ be emitted if the console level allows _and_
	DEBUG is defined or dynamic_debug is enabled
		(and for dynamic_debug, only if specifically enabled)
	DEBUG is defined and dynamic_debug is enabled

> diff --git a/drivers/input/evbug.c b/drivers/input/evbug.c
[]
> @@ -21,8 +21,8 @@ MODULE_LICENSE("GPL");
>  
> 
>  static void evbug_event(struct input_handle *handle, unsigned int type, unsigned int code, int value)
>  {
> -	printk(KERN_DEBUG pr_fmt("Event. Dev: %s, Type: %d, Code: %d, Value: %d\n"),
> -	       dev_name(&handle->dev->dev), type, code, value);
> +	pr_debug("Event. Dev: %s, Type: %d, Code: %d, Value: %d\n",
> +		 dev_name(&handle->dev->dev), type, code, value);
>  }


