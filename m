Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E02F0EAA6D
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2019 06:42:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726404AbfJaFmP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 31 Oct 2019 01:42:15 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:37294 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726321AbfJaFmO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 31 Oct 2019 01:42:14 -0400
Received: by mail-ot1-f65.google.com with SMTP id 53so4346881otv.4;
        Wed, 30 Oct 2019 22:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NFOmH+X1zL15bEQ+0SP3D+wVm5m7cWoIjddeXOmNWis=;
        b=eXNFG2SXsL9b1x6q7lAgPhnuMoQAzJF21zbs5UhqxjhJeHA+91N5noHZGTRXt5++Cm
         vwy0zL1vmeyQcZTw9htTRB9XuFml2B5ff7NJs5YnQ41HZifNqhvEfZqYygawtRB/LU7c
         sXrW/uKMUCtNg/P74t2GooIxHeq0Gv2jXweyvLTzXtGk4EEge8tcb/+7rCLjnOPIJNds
         dHIEsT/ub90pbOjfvyBYAp2fWAP73/SPcMOrAfLRvAJVgz82Pf5oHR4lI16evfHkjYWz
         qVwqjkWsNh8fKeWkSEwMO+Dp73HRJhtJSg1Uqd8VAFj4ppi7mhgj4zJ+U7OHwU/iANq5
         WICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NFOmH+X1zL15bEQ+0SP3D+wVm5m7cWoIjddeXOmNWis=;
        b=gLDXUS4WD2EuXS0thS087d9buGdrW70BAHVz6JdCQtjyPNUN5oRutk63hS+oSjpkBP
         xK0EvlMl0b5x/kYVAr77VuGe/6s9XSW/umfAcZUr/EFAegRL7qifLgBxQnjSwBExhpkX
         dmMrPFeJEGg+9dDbhPU/lqpzLvI+oQmp6cWpKXO6uZ3r59wjzGbftKAezy+D/mob6rG8
         AEHCKdNXoNQNsBjH4CY5eWnZ8tsQJGJFx0nl+qSlI8ZJ7+kdE+QaNtUIX63OXyodtYyr
         kJvpGoLrJwJkV1Ff2Nd/K7P6Iz5wQ+GnoNyVaMRdI5+NoYO54nmWNHhoTRWlbGls2qET
         J+kg==
X-Gm-Message-State: APjAAAUhncS0lyJgWutteca+vDa2XZ7Nz3H4VZ3z6KQIskSNTlPI0hX9
        4XdSKqdFiV5FnVo/eR09+LU=
X-Google-Smtp-Source: APXvYqx5hNnAJsc9WyHXr2j5TdrQCtHYOXjDDNgSHQBS5iBRNflmYTlpJXbQJ4F2Hw2R0/45k1y5jA==
X-Received: by 2002:a9d:611c:: with SMTP id i28mr1000462otj.348.1572500531565;
        Wed, 30 Oct 2019 22:42:11 -0700 (PDT)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id f9sm835784otq.52.2019.10.30.22.42.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Oct 2019 22:42:10 -0700 (PDT)
Date:   Wed, 30 Oct 2019 22:42:09 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Jiada Wang <jiada_wang@mentor.com>
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        rydberg@bitmath.org, dmitry.torokhov@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH v4 24/48] Input: atmel_mxt_ts - make bootloader interrupt
 driven
Message-ID: <20191031054209.GA44197@ubuntu-m2-xlarge-x86>
References: <20191029072010.8492-1-jiada_wang@mentor.com>
 <20191029072010.8492-25-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191029072010.8492-25-jiada_wang@mentor.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jiada,

On Thu, Oct 31, 2019 at 01:26:23PM +0800, kbuild test robot wrote:
> CC: kbuild-all@lists.01.org
> In-Reply-To: <20191029072010.8492-25-jiada_wang@mentor.com>
> References: <20191029072010.8492-25-jiada_wang@mentor.com>
> TO: Jiada Wang <jiada_wang@mentor.com>
> CC: jikos@kernel.org, benjamin.tissoires@redhat.com, rydberg@bitmath.org, dmitry.torokhov@gmail.com
> CC: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, jiada_wang@mentor.com, erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
> 
> Hi Jiada,
> 
> I love your patch! Perhaps something to improve:
> 
> [auto build test WARNING on input/next]
> [also build test WARNING on v5.4-rc5 next-20191030]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
> 
> url:    https://github.com/0day-ci/linux/commits/Jiada-Wang/atmel_mxt_ts-misc/20191031-032509
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
> config: arm64-defconfig (attached as .config)
> compiler: clang version 10.0.0 (git://gitmirror/llvm_project 6cb181f086a5bc69a97c1a01e9a36f8293dea7ed)
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=arm64 
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/input/touchscreen/atmel_mxt_ts.c:1190:2: error: implicit declaration of function 'dev_debug' [-Werror,-Wimplicit-function-declaration]
>            dev_debug(dev, "T92 long stroke LSTR=%d %d\n",
>            ^
>    drivers/input/touchscreen/atmel_mxt_ts.c:1200:2: error: implicit declaration of function 'dev_debug' [-Werror,-Wimplicit-function-declaration]
>            dev_debug(dev, "T93 report double tap %d\n", status);
>            ^
> >> drivers/input/touchscreen/atmel_mxt_ts.c:1402:36: warning: address of 'data->flash->work' will always evaluate to 'true' [-Wpointer-bool-conversion]
>                    if (data->flash && &data->flash->work)
>                                    ~~  ~~~~~~~~~~~~~^~~~

The 0day team has been running clang builds for us and this warning
popped up because of this commit. Presumably, you will need to spin
up a v5 because of the other error, mind addressing this warning
while you are at it? As it points out, the check should be unnecessary,
unless you meant to check for something else?

>    1 warning and 2 errors generated.
> 
> vim +1402 drivers/input/touchscreen/atmel_mxt_ts.c
> 
>   1394	
>   1395	static irqreturn_t mxt_interrupt(int irq, void *dev_id)
>   1396	{
>   1397		struct mxt_data *data = dev_id;
>   1398	
>   1399		if (data->in_bootloader) {
>   1400			complete(&data->chg_completion);
>   1401	
> > 1402			if (data->flash && &data->flash->work)
>   1403				cancel_delayed_work_sync(&data->flash->work);
>   1404	
>   1405			return IRQ_RETVAL(mxt_check_bootloader(data));
>   1406		}
>   1407	
>   1408		if (!data->object_table)
>   1409			return IRQ_HANDLED;
>   1410	
>   1411		if (data->T44_address) {
>   1412			return mxt_process_messages_t44(data);
>   1413		} else {
>   1414			return mxt_process_messages(data);
>   1415		}
>   1416	}
>   1417	
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
> 

Cheers,
Nathan
