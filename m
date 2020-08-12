Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8142B2428DF
	for <lists+linux-input@lfdr.de>; Wed, 12 Aug 2020 13:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726804AbgHLLpt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Aug 2020 07:45:49 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:45944 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726404AbgHLLps (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Aug 2020 07:45:48 -0400
Received: by mail-ed1-f66.google.com with SMTP id di22so1258527edb.12;
        Wed, 12 Aug 2020 04:45:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iTU/Dy21v99MwSHqqPqln63atgzchISHbIicoIdY0tk=;
        b=iaxO3rPceLJ+Qj2uASzUgbrOtFJMqrYlolbtJTfxSaw6H/M4hNRFEWoZ6SH99xtlf7
         gTR1szVb+3W6EY0xgMYBNVHMB8nYQ8zYT6PRCn5khbBV70oGSmXSkeQW1ipzWaomNsb6
         qXLG0/kRmyyLIG3H9u5x0kbPYoH/wfgznYuVsJMd347nFU+qzjPKumqTaFVekTyTsqyx
         /4KW0MHJUSyjoh31UVBE6fz4wRKi+kqIdUbTDobVuie3smYJVpVZNSe59NQGVKtd0/eN
         M6WZNWvnBmCpaaQazG3g2OfAyzw62N1uKRGiT+qpsGZvBPc5fSptp7v1d9gFauEOUuif
         sqew==
X-Gm-Message-State: AOAM532aBH+u4OoMDofunyGYNGx5pDMCL1TBtCOL6MEjykzo0SZUG707
        CKErMcGLBg4XA+/6ypcDxobP0lOR
X-Google-Smtp-Source: ABdhPJyQYKB9lc6XsHvt9BA0UwESU/c4LN6Y2ZfWc0iT1x0hR74d4+JSLFM8jMPq4vnjCzXWoSGHtQ==
X-Received: by 2002:a50:f288:: with SMTP id f8mr30925078edm.247.1597232746140;
        Wed, 12 Aug 2020 04:45:46 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
        by smtp.gmail.com with ESMTPSA id d9sm755726edt.20.2020.08.12.04.45.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2020 04:45:45 -0700 (PDT)
Subject: Re: [PATCH 2/2] tty/sysrq: Add configurable handler to execute a
 compound action
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, kernel@collabora.com
References: <20200804162402.2087-1-andrzej.p@collabora.com>
 <20200804162402.2087-3-andrzej.p@collabora.com>
From:   Jiri Slaby <jirislaby@kernel.org>
Message-ID: <0280e30a-2e70-7d21-68a9-5a2c22d7f316@kernel.org>
Date:   Wed, 12 Aug 2020 13:45:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200804162402.2087-3-andrzej.p@collabora.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 04. 08. 20, 18:24, Andrzej Pietrasiewicz wrote:
> Userland might want to execute e.g. 'w' (show blocked tasks), followed
> by 's' (sync), followed by 1000 ms delay and then followed by 'c' (crash)
> upon a single magic SysRq. Or one might want to execute the famous "Raising
> Elephants Is So Utterly Boring" action. This patch adds a configurable
> handler, triggered with 'C', for this exact purpose. The user specifies the
> composition of the compound action using syntax similar to getopt, where
> each letter corresponds to an individual action and a colon followed by a
> number corresponds to a delay of that many milliseconds, e.g.:
> 
> ws:1000c
> 
> or
> 
> r:100eis:1000ub

I think I miss what's that good for, given I can do it one-by-one
without setting such strings anywhere (I usually want to do different
things on different kinds of crashes)?

> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>  Documentation/admin-guide/sysrq.rst |  9 ++++
>  drivers/tty/sysrq.c                 | 81 ++++++++++++++++++++++++++++-
>  include/linux/sysrq.h               |  1 +
>  3 files changed, 90 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/sysrq.rst b/Documentation/admin-guide/sysrq.rst
> index 67dfa4c29093..80bdd8bf9636 100644
> --- a/Documentation/admin-guide/sysrq.rst
> +++ b/Documentation/admin-guide/sysrq.rst
> @@ -32,6 +32,7 @@ to 1. Here is the list of possible values in /proc/sys/kernel/sysrq:
>           64 =  0x40 - enable signalling of processes (term, kill, oom-kill)
>          128 =  0x80 - allow reboot/poweroff
>          256 = 0x100 - allow nicing of all RT tasks
> +        512 = 0x200 - allow compound action
>  
>  You can set the value in the file by the following command::
>  
> @@ -148,6 +149,14 @@ Command	    Function
>  
>  ``z``	    Dump the ftrace buffer
>  
> +``C``	    Execute a predefined, compound action. The action is defined with
> +	    sysrq.sysrq_compound_action module parameter, whose value contains known
> +	    command keys (except ``C`` to prevent recursion). The command keys can
> +	    be optionally followed by a colon and a number of milliseconds to wait
> +	    after executing the last action. For example:
> +
> +	    sysrq.sysrq_compound_action=r:100eis:1000ub
> +
>  ``0``-``9`` Sets the console log level, controlling which kernel messages
>              will be printed to your console. (``0``, for example would make
>              it so that only emergency messages like PANICs or OOPSes would
> diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
> index 52e344bfe8c0..ffcda1316675 100644
> --- a/drivers/tty/sysrq.c
> +++ b/drivers/tty/sysrq.c
> @@ -19,6 +19,7 @@
>  #include <linux/sched/rt.h>
>  #include <linux/sched/debug.h>
>  #include <linux/sched/task.h>
> +#include <linux/delay.h>
>  #include <linux/interrupt.h>
>  #include <linux/mm.h>
>  #include <linux/fs.h>
> @@ -439,6 +440,15 @@ static const struct sysrq_key_op sysrq_unrt_op = {
>  	.enable_mask	= SYSRQ_ENABLE_RTNICE,
>  };
>  
> +static void sysrq_action_compound(int key);
> +
> +static struct sysrq_key_op sysrq_action_compound_op = {
> +	.handler	= sysrq_action_compound,
> +	.help_msg	= "execute-compound-action(C)",
> +	.action_msg	= "Execute compound action",
> +	.enable_mask	= SYSRQ_ENABLE_COMPOUND,
> +};
> +
>  /* Key Operations table and lock */
>  static DEFINE_SPINLOCK(sysrq_key_table_lock);
>  
> @@ -501,7 +511,7 @@ static const struct sysrq_key_op *sysrq_key_table[62] = {
>  	&sysrq_ftrace_dump_op,		/* z */
>  	NULL,				/* A */
>  	NULL,				/* B */
> -	NULL,				/* C */
> +	&sysrq_action_compound_op,	/* C */
>  	NULL,				/* D */
>  	NULL,				/* E */
>  	NULL,				/* F */
> @@ -634,6 +644,7 @@ EXPORT_SYMBOL(handle_sysrq);
>  
>  #ifdef CONFIG_INPUT
>  static int sysrq_reset_downtime_ms;
> +static char *sysrq_compound_action;
>  
>  /* Simple translation table for the SysRq keys */
>  static const unsigned char sysrq_xlate[KEY_CNT] =
> @@ -787,6 +798,61 @@ static void sysrq_of_get_keyreset_config(void)
>  {
>  }
>  #endif
> +#define SYSRQ_COMPOUND_ACTION_VALIDATE	0
> +#define SYSRQ_COMPOUND_ACTION_RUN	1
> +
> +static int sysrq_process_compound_action(int pass)
> +{
> +	const char *action = sysrq_compound_action;
> +	const struct sysrq_key_op *op_p;
> +	int ret, delay;
> +
> +	while (*action) {
> +		op_p = __sysrq_get_key_op(*action);
> +		if (!op_p)
> +			return -EINVAL;
> +
> +		/* Don't allow calling ourselves recursively */
> +		if (op_p == &sysrq_action_compound_op)
> +			return -EINVAL;
> +
> +		if (pass == SYSRQ_COMPOUND_ACTION_RUN)
> +			__handle_sysrq(*action, false);
> +
> +		if (*++action == ':') {
> +			ret = sscanf(action++, ":%d", &delay);

You likely want %u and unsigned int. No negative delays.

> +			if (ret < 1) /* we want at least ":[0-9]" => 1 item */
> +				return -EINVAL;
> +
> +			while (*action >= '0' && *action <= '9')
> +				++action;
> +			if (pass == SYSRQ_COMPOUND_ACTION_RUN)
> +				mdelay(delay);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void sysrq_action_compound(int key)
> +{
> +	if (!sysrq_compound_action) {
> +		pr_err("Unconfigured compound action for %s",
> +		       sysrq_action_compound_op.help_msg);

Missing \n.

> +		return;
> +	}
> +
> +	if (sysrq_process_compound_action(SYSRQ_COMPOUND_ACTION_VALIDATE)) {
> +		pr_err("Incorrect compound action %s for %s",

The same.

> +		       sysrq_compound_action,
> +		       sysrq_action_compound_op.help_msg);
> +
> +		return;
> +	}
> +
> +	sysrq_process_compound_action(SYSRQ_COMPOUND_ACTION_RUN);
> +}
>  
>  static void sysrq_reinject_alt_sysrq(struct work_struct *work)
>  {
> @@ -1079,8 +1145,21 @@ module_param_array_named(reset_seq, sysrq_reset_seq, sysrq_reset_seq,
>  
>  module_param_named(sysrq_downtime_ms, sysrq_reset_downtime_ms, int, 0644);
>  
> +module_param(sysrq_compound_action, charp, 0644);
> +MODULE_PARM_DESC(sysrq_compound_action,
> +	"Compound sysrq action to be executed on Alt-Shift-SysRq-C\n"
> +	"The compound action definition consists of known SysRq action letters except 'C',\n"
> +	"each letter can be optionally followed by a colon and a number of milliseconds to wait\n"
> +	"after executing the last action.\n"
> +	"Example:\n"
> +	"To unRaw, wait 100ms, tErminate, kIll, Sync, wait 1000ms, Unmount, Boot\n"
> +	"sysrq.sysrq_compound_action=r:100eis:1000ub");

This looks bad in the output, use at least one \t at the start of a new
line inside the string.

-- 
js
suse labs
