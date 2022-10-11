Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D3D85FB340
	for <lists+linux-input@lfdr.de>; Tue, 11 Oct 2022 15:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbiJKNV1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Oct 2022 09:21:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbiJKNVH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Oct 2022 09:21:07 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77CC036DC2
        for <linux-input@vger.kernel.org>; Tue, 11 Oct 2022 06:20:01 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id n12so21551820wrp.10
        for <linux-input@vger.kernel.org>; Tue, 11 Oct 2022 06:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DvSlLe858PoYsneJVvkvxYmTO/MSQp1hV+RsXdWck/A=;
        b=y1iSNzXKyjal5MgagjxAqeM0ji/Iie4A+NxTZ1jW8IOEiPkbiiEnReIoSfRFtYsmYf
         KF/4ZgDpBtSKthGVwuL0r9y5nesTrFJHm3MkiGwsVnHtXd7FkFyiCNGJF08PqUb4JgW3
         VxE1/AETFIXKbRY02zrXK7X3Ma+OSMtAYeurIhvDd2dZdWZjfZbx1qLwMCATlrlMk3o5
         CGRVmwpyrDp+EI3CTYmOHo6lnigK6Ppq34uuVRVigFVUFXBa234zF04V1Du6wvhq/BRI
         xso2JPtZPiSXV2cIl1+qAFiQGQ0wzUzDzCLeuftuxCpwK8OxQdxjzNMn/veo3/qiav6d
         KoeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DvSlLe858PoYsneJVvkvxYmTO/MSQp1hV+RsXdWck/A=;
        b=x+kIaBTuY/Cb73nKXhCws05UjgIBdLzBF1I2DdxSgs//okMYRu+4PofSWRfmmiYmOc
         UXK/C87tHidOHWOIa8hd8NksPhQ+B/BE1HRPJUpTSk1/3ughBac7cyXxWgj8IvYcqQgY
         KXER3KsKgwfOpBV4tofasepzxrvx7ZR/EfSq0sOuvrWoJkALGviyJEpTZfB7K8zb2wUx
         1q8pN1CySTMRQFblrYrfDf1o/ZsaGS0o3Og7IjIXiArMIXiqBhCOer+Xmy5PWo+zSp+b
         +tr4/husYvQrcyeW43X/5KVCLJHgFfBI37qJjsMaAStINicviYvkKXoHMw5kPZppW/Gg
         cW1Q==
X-Gm-Message-State: ACrzQf2dRCcLl5x0MIx7pXtq/Esl1UHcoBtVa1Gg7WOVBRXkPKVSpmYS
        SyzF7uiukUBGMHWhiYTnZy6JUg==
X-Google-Smtp-Source: AMsMyM5qzQvUbe8DAK27GyEUlQTMd87aS9E+IBE7m/ZvINPReW/3uEaVLa9sCtITzv+GhHc3Sc+bHg==
X-Received: by 2002:a5d:47c5:0:b0:22e:6941:81eb with SMTP id o5-20020a5d47c5000000b0022e694181ebmr14827916wrc.408.1665494384571;
        Tue, 11 Oct 2022 06:19:44 -0700 (PDT)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id j13-20020a5d604d000000b0022ae4f8395dsm11138386wrt.96.2022.10.11.06.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 06:19:43 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Eirin Nya <nyanpasu256@gmail.com>, linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] Input: Fix incorrectly halved touchpad range on
 ELAN v3 touchpads
In-Reply-To: <e4438675-d7f6-02f1-79c0-aa9917db8997@gmail.com>
References: <20220929082119.22112-1-nyanpasu256@gmail.com>
 <20220929082119.22112-4-nyanpasu256@gmail.com>
 <87czb37mpb.fsf@mkorpershoek-xps-13-9370.home>
 <e4438675-d7f6-02f1-79c0-aa9917db8997@gmail.com>
Date:   Tue, 11 Oct 2022 15:19:42 +0200
Message-ID: <87fsfu33bl.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Eirin,

On Sat, Oct 08, 2022 at 03:38, Eirin Nya <nyanpasu256@gmail.com> wrote:

> On 10/7/22 6:35 AM, Mattijs Korpershoek wrote:
>> Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
>> 
>> ps: please consider using the proper subject line for input subsystem if
>> you need to send again.
>> 
>> It should be "Input: elantech - Remove redundant field elantech_data::width
> On 10/7/22 7:06 AM, Mattijs Korpershoek wrote:
>> This seems like a candidate patch for stable kernels as well.
>> 
>> Maybe consider adding the following in the commit message footer:
>> Fixes: 28f49616113f ("Input: elantech - add v3 hardware support")
>> 
>> Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
>
> Should I submit a v2 where I change the subject line for all commits
> and add a Fixes: tag to patch 3/3 (or 0/3, not sure), but not change
> the code? Sorry, I'm new to kernel development.

No worries. It's not a very newcomer friendly process. I'm not that
experienced myself but i'll try to help you.

No need to just re-submit a v2 for changing the subject line.
If you do have to send a v2, however, please keep in mind to do the change.

For the Fixes: tag itself, I think it should only be applied on patch
[3/3] since that's the one "actually doing the fix"

The stable maintainers will detect a Fixes: tag and will eventually pick
this up once it lands in linus' tree.
