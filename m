Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16CD790680
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 19:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727181AbfHPRMc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 13:12:32 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:38451 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726690AbfHPRMc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 13:12:32 -0400
Received: by mail-pl1-f193.google.com with SMTP id m12so2692262plt.5;
        Fri, 16 Aug 2019 10:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yQNLmd/PNTbgMUp0pljokRpiChsdyHtCXi9Clu+3OSg=;
        b=V+YyBh4XALfXEdFF014Lkdwx6nCwrneUCR/CNCyJQ8U3+iC7F1d7cLjCcozo1dPp+V
         9z8YqHQM/bzfnJXduy2AYYv87LjO/mzeLbF89zKHBoncUZzrH4w3SlOD2wfXgURd+fQh
         N4v4CU+sT/yr20vuvwKW6SJyloYIkZQ+d2V82gAnndEdblYmc46TYF9qS3p7VwPQK+G2
         Bo6K/2q6eI7niTJ8EJ2HhV+GoHAPBUnRsfH/YDsR/09gPCkPdMuURBN5wwgT/kwWiyqq
         HPZ7Uh+Vo6jGUsXLitLQDfGra9ps6l3yEPsTbeiaNvVzywf0KLGLQtz0OuaNgJTUZr62
         mI/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yQNLmd/PNTbgMUp0pljokRpiChsdyHtCXi9Clu+3OSg=;
        b=kbqEu6d9PgW6JNekaXA23i1kl31FKLp9LQFZrNyUM0dfJlgAvWVo7dy/cedjFitMdp
         E0srCeZ1Qbd/crksTXHYc3jEQb/SkcxSQY2bcr/uXioO1fjuU8lz9qhdu958tXizMj3J
         MIxADNG6Tp2g0laAi19buPLauMKBIXCzU8zO85WY5X8nHbq2QT2GgiOCKvKSfFUF9hkr
         +KTHEQ8Ayu4PDGC+uzGS8j8oEsfeTQrWsvmhXUxNqXQQGLvkYB6mPHPAZU8frtI8rnNn
         TO4KcEwRXhCsv6j0jdCMfhy4a+LyuYr70EtjwqN15yhs6hJ/2IcHXZRUpQ0KeIOYekpK
         vjlg==
X-Gm-Message-State: APjAAAXelUjqI0lhZq4Ovn3h70PfRKYiqVJrwUHJzznw5Z1Y2kOakhRR
        O/C98YMswW58ejhCfWp2IDQ=
X-Google-Smtp-Source: APXvYqyQJrjt7kV43iu5grgdMPhUeQ7/S+APmixruXVnPg5j65jiZ7mXLu7c1r4C2aMFm+WTFtTCOQ==
X-Received: by 2002:a17:902:76c7:: with SMTP id j7mr10054039plt.247.1565975550819;
        Fri, 16 Aug 2019 10:12:30 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id n128sm6319223pfn.46.2019.08.16.10.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2019 10:12:28 -0700 (PDT)
Date:   Fri, 16 Aug 2019 10:12:26 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jiada Wang <jiada_wang@mentor.com>
Cc:     nick@shmanahar.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, george_davis@mentor.com
Subject: Re: [PATCH v1 01/63] Input: introduce input_mt_report_slot_inactive
Message-ID: <20190816171226.GE121898@dtor-ws>
References: <20190816082952.17985-1-jiada_wang@mentor.com>
 <20190816082952.17985-2-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190816082952.17985-2-jiada_wang@mentor.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jiada,

On Fri, Aug 16, 2019 at 05:28:50PM +0900, Jiada Wang wrote:
> input_mt_report_slot_state() ignores the tool when the slot is closed.
> which has caused a bit of confusion.
> This patch introduces input_mt_report_slot_inactive() to report slot
> inactive state.
> replaces all input_mt_report_slot_state() with input_mt_report_slot_inactive()
> in case of close of slot, also some other related changes.

This seems to actually contain 2 changes:

- switching to use return value of input_mt_report_slot_state()
- actually introducing and using input_mt_report_slot_inactive()

Please split them.

>  
> +/**
> + * input_mt_report_slot_inactive() - report contact inactive state
> + * @dev: input device with allocated MT slots
> + *
> + * Reports the contact inactive state via ABS_MT_TRACKING_ID
> + *
> + */
> +void input_mt_report_slot_inactive(struct input_dev *dev)
> +{
> +	input_event(dev, EV_ABS, ABS_MT_TRACKING_ID, -1);
> +}
> +EXPORT_SYMBOL(input_mt_report_slot_inactive);

I think this should be a static inline, there is no need to have out of
line implementation for a 1-liner.

Thanks.

-- 
Dmitry
