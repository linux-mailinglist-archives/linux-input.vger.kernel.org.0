Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DFEB4F0BC9
	for <lists+linux-input@lfdr.de>; Sun,  3 Apr 2022 20:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357636AbiDCSgq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 3 Apr 2022 14:36:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355137AbiDCSgq (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 3 Apr 2022 14:36:46 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 760043617F
        for <linux-input@vger.kernel.org>; Sun,  3 Apr 2022 11:34:51 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id ke15so5908520qvb.11
        for <linux-input@vger.kernel.org>; Sun, 03 Apr 2022 11:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=seas-upenn-edu.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=wLPv9OeT2UB50NvNGEyvsKry+1/435GpuFTJwAgtXN0=;
        b=wMHkHASoDp+kQkJx1a2+pn40glNGojOsB/eb0yGnmVUrSObZqxvwA879DbyBB69hVn
         pbbJhBFjm2SQ5ZJNR8yhlRhkj8MHjmFUIiVXvE1vjD5IEkQQ3koC0VWNy7R0JV23Xunh
         S7Go1zRIwRuZzQHaS+ntNqC8iQPO68eiLe/b30vWV/tENsv7+HrdkvY9TeZ3yEdOXTSA
         KEJUte2TU26h/Prnp1KmGFLwmNYCi3G06fT4miPWBkec7QZhQCf76rLPGm4UgpIcYZUX
         s9NCE3FOqYSfBgStM0yz2rzmE65PI8sZudk+teVqgdvZG1lB3vn6W+0+R2SZT4JkPh+w
         u63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wLPv9OeT2UB50NvNGEyvsKry+1/435GpuFTJwAgtXN0=;
        b=NpUOa00Oo1IZVMqK+PEfTAeq1IaKOlUoPvymHhSVCrvjcn9sNJCJzMZNHrPQU/Po9D
         ueyOJnYmvyQNKP2knFl81+YbBTv6BiKP6L9UOo5wgqGzUO3ab7Sr/ppCYvAqZOhiDnVv
         gNJ/8kCIDF9PN69ea59LPBjrJxSSzXM2jxIyDjPEBHH8MJxOQdsTxEyw7sNOdHQjypA6
         xxWTldTUKHtQ9pwvHooLFg9+RPKXp9XVHlWsvHl53A1P5hhosnnrFk6xImZjNyxkmUUu
         na87+ctQdwywXLW0m3YGt8eMUOXMqrGyQ65w71J0cE0gGJO3i/A5LH+kSESgKxgLw0ex
         oB1A==
X-Gm-Message-State: AOAM532/FDalbNudmhhRGogcTeJaR+UCN5AjjEf9RFisu525wbxq1KZl
        92Eb1kLTAaPxHtZmPeh3JS1CMQ==
X-Google-Smtp-Source: ABdhPJziRI0vhS/Es/ElkSCB7SGxct7zssXOti3hF+6t+op2GXe7IJHbYo/uWwUCCrb7oZn+2OUv/g==
X-Received: by 2002:a05:6214:248c:b0:441:2a61:659d with SMTP id gi12-20020a056214248c00b004412a61659dmr14481205qvb.59.1649010890680;
        Sun, 03 Apr 2022 11:34:50 -0700 (PDT)
Received: from [192.168.1.55] (pool-96-227-49-89.phlapa.fios.verizon.net. [96.227.49.89])
        by smtp.googlemail.com with ESMTPSA id f19-20020a05620a409300b00680c933fb1csm5682570qko.20.2022.04.03.11.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Apr 2022 11:34:50 -0700 (PDT)
Message-ID: <e6b53360-6fa7-a295-cba1-9a27e2b3665f@seas.upenn.edu>
Date:   Sun, 3 Apr 2022 14:34:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] HID: hid-ntrig: fix the error handling code in
 ntrig_probe
Content-Language: en-US
To:     Jiri Kosina <jikos@kernel.org>,
        Mingxuan Xiang <mx_xiang@hust.edu.cn>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dongliang Mu <dzm91@hust.edu.cn>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220313150237.1214062-1-mx_xiang@hust.edu.cn>
 <nycvar.YFH.7.76.2203301722301.24795@cbobk.fhfr.pm>
From:   Rafi Rubin <rafi@seas.upenn.edu>
In-Reply-To: <nycvar.YFH.7.76.2203301722301.24795@cbobk.fhfr.pm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The writable parameters are also settable as module parameters and I suspect are not really widely used. I used them for tuning the defaults and dealing with unreliable devices, not in the course of normal use.  So I agree creation of the sysfs nodes 
should not block probing and using the device.

Thank you for working on the error handling,
Rafi
