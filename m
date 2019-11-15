Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76F27FE59A
	for <lists+linux-input@lfdr.de>; Fri, 15 Nov 2019 20:29:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbfKOT3o (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Nov 2019 14:29:44 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35008 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbfKOT3o (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Nov 2019 14:29:44 -0500
Received: by mail-pg1-f196.google.com with SMTP id k32so740627pgl.2;
        Fri, 15 Nov 2019 11:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WaaUqkfXG6+isoCbG7XYOEWjloSaTM6xtmYz8DIEXkU=;
        b=rno4ShLranjXQFBAlU93J9agjWmAohLT/NdRrnQdjDUvjW356IzQ/i9DS3WBVnPDqV
         z8gigtrhOVqd3thKFp3iS3rfHFx8pOMX8kxLllIUow02vLgDJLbXR0WAE+7+kMmcAryh
         i2Jirm/5qv/g2NBLzZ7QkEKSWgRx24NjeC4ozzllWCYiFM2kRX9WJ89UdCUA4wAOptAQ
         2N0duLD2Y0qQG3e0MPq6W8AsQdG5pzT0RUgucaxmHbeJ0HniRbYC+nvbjA8RGBHtKwBV
         rktbUdQ7RE+vtevZ4LiJ91G6zsFbsDPEIN6rK8rOx7NsH8g/Wo6IgI2M8AcFXfPqNZB4
         33hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WaaUqkfXG6+isoCbG7XYOEWjloSaTM6xtmYz8DIEXkU=;
        b=e4nv5CbvG9qX6Bw0Q92WO7sW3N7noTXL2Sz5S1A9Sff14PXraHbVOnySn2wuL+Qs2j
         ILuiosSlW+BUsvlNiWIvZfuuXtob+iZAoreY8HbqW8Goife8VqbeVbYxletMq1/Zeoho
         cPpghNy8tLkItxtgaMnY8ttWdPt5nTwhEVjqgptgpEsQIkMd+Lzp84zqugipHx3ztyiy
         ddpOvLECWN0ZHnG4yfKKK4tgjLtgZ/z3RHTmRKsUYoQ34THoqDV4LLz5bOezPfiRBytg
         2XnaDF5o4qujCLo+Vhx9R1lXtzAJhfo48Xi6CH07RZ9NNyC2xc0rgy6aamfOlufgGd41
         VfHQ==
X-Gm-Message-State: APjAAAWNLPdpNL0MBoayH+F7qdFXHHT56J5/wL76BuNO76WkcLVMIJn2
        HKTOrBUfPAiC35Pzz6+Lr/Y=
X-Google-Smtp-Source: APXvYqx+ExOdXdGMW9KMuDs01Hxq3xtbd7o1vtnDS+THGhL5gHHqzvTh80CDe3Z7gJU6ge3RkVCvWg==
X-Received: by 2002:a62:1ad6:: with SMTP id a205mr19315307pfa.64.1573846183595;
        Fri, 15 Nov 2019 11:29:43 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id c9sm10908010pfn.65.2019.11.15.11.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 11:29:42 -0800 (PST)
Date:   Fri, 15 Nov 2019 11:29:40 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     kernel test robot <rong.a.chen@intel.com>
Cc:     Jiada Wang <jiada_wang@mentor.com>, jikos@kernel.org,
        benjamin.tissoires@redhat.com, rydberg@bitmath.org,
        nick@shmanahar.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, erosca@de.adit-jv.com,
        Andrew_Gabbasov@mentor.com, lkp@lists.01.org
Subject: Re: [Input] 9290ec3cea: suspend_stress.fail
Message-ID: <20191115192940.GT13374@dtor-ws>
References: <20191106070146.18759-2-jiada_wang@mentor.com>
 <20191114094424.GF6910@shao2-debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191114094424.GF6910@shao2-debian>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 14, 2019 at 05:44:25PM +0800, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> 
> commit: 9290ec3cea1dd9d312d1230825a75c798b670ea1 ("[PATCH v5 01/48] Input: introduce input_mt_report_slot_inactive")
> url: https://github.com/0day-ci/linux/commits/Jiada-Wang/atmel_mxt_ts-misc/20191108-190609
> base: https://git.kernel.org/cgit/linux/kernel/git/xen/tip.git linux-next
> 
> in testcase: suspend_stress
> with following parameters:
> 
> 	mode: mem
> 	iterations: 10
> 
> 
> 
> on test machine: 8 threads KabyLake-r with 8G memory
> 
> caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):

Is this reproducing reliably? I do not see dmesg attached so it is
unclear what input device(s) are connected to the system...

Thanks.

-- 
Dmitry
