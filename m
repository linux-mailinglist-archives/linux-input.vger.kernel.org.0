Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94C156EBB0F
	for <lists+linux-input@lfdr.de>; Sat, 22 Apr 2023 21:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbjDVT4q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 22 Apr 2023 15:56:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbjDVT4p (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 22 Apr 2023 15:56:45 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93866199A
        for <linux-input@vger.kernel.org>; Sat, 22 Apr 2023 12:56:44 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-2f40b891420so2854354f8f.0
        for <linux-input@vger.kernel.org>; Sat, 22 Apr 2023 12:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682193403; x=1684785403;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X9yZH5jobw+2NxtflHbFeViB++WpgYUG8lLecB6Yof4=;
        b=CtthS9YsA6btqa4JO6vI8qG6Ei18swg2oPFg8KSHXvYFTzsNah2B3GZZ2DkXLIK3Bu
         WM0pmmAqy8lmu8V5P5lBn6SpKmEQLfSQRnN9RvwhNc6BvTCdoCQ0A8lMUYzZCukwctyR
         aHCIqkRnqpEv6uttQW+6QMeoM+SujZq10TVVXX8rdWR6DXNqDEHeemDTMcLHjoTM9FqD
         doVI7jomezoHjx23hxLkDztftgUtxd1JXMvb2eIKQW5Ntoilq1SiNUJUzrOmd9GQkQoP
         hzz2hmyx516OXcG72SALiwE7+ltPW0o7cRxRdqn5nMsGaCPULJuP4JTnjbysaF57fbUW
         1L/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682193403; x=1684785403;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X9yZH5jobw+2NxtflHbFeViB++WpgYUG8lLecB6Yof4=;
        b=CE6cBJCHPZaUkgYDSU9HrhllRrMih5JmmiavMPYzvxOq7w1Dr2ZMntl6dKxBNSjg2/
         WUM3UfXg4gO9ZY1JLnahY08Nfoq7MRN4S9WSTzS8WVGze++xmzIOdvkOEOn18pXtJL5H
         wvK4ECLElq78T4C/eBEeZvL0CyN0XlLqfbu9IB7mPu5VlU44Aq8RfXzRMD9DBPn3m3E6
         GDbcgl9F7hytGJEuRNsyhI62UVKM5xnEcWPmMM95+T1O/aftM13TJZFTYCmVqOWxPGK/
         hasqU8FlyeDW272D/AG2eYBq3QOTlFXP/dzglVtDaHmL3cvBaN+enoZfREPRFXHJYWMr
         cyDg==
X-Gm-Message-State: AAQBX9drrGESUJgci7djNYNq7LaMAvz+6Uyebl6fw/4k6Y1GcTKBDd8U
        tJVaeUV17HGDGOWwFLS20ByiDV9k0X0f06gm5O4=
X-Google-Smtp-Source: AKy350aU1g4P2e/Je3n5HyLAU9lTZT6CKyVdRbmopfPN/a5RVwo2XdTRo1sK9qdXYS1MlABzSAFFUA==
X-Received: by 2002:adf:e2c8:0:b0:2ef:bc0b:e70 with SMTP id d8-20020adfe2c8000000b002efbc0b0e70mr7197653wrj.54.1682193403110;
        Sat, 22 Apr 2023 12:56:43 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i3-20020adff303000000b002f4cf72fce6sm7206104wro.46.2023.04.22.12.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Apr 2023 12:56:42 -0700 (PDT)
Date:   Sat, 22 Apr 2023 22:56:39 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Dan Carpenter <error27@gmail.com>
Cc:     Dongliang Mu <dzm91@hust.edu.cn>, Vicki Pfau <vi@endrift.com>,
        kernel-janitors@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Pavel Rojtberg <rojtberg@gmail.com>,
        Nate Yocom <nate@yocom.org>,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        John Butler <radon86dev@gmail.com>,
        Matthias Benkmann <matthias.benkmann@gmail.com>,
        Christopher Crockett <chaorace@gmail.com>,
        Santosh De Massari <s.demassari@gmail.com>,
        hust-os-kernel-patches@googlegroups.com,
        syzbot+a3f758b8d8cb7e49afec@syzkaller.appspotmail.com,
        "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: xpad - fix GPF in xpad_probe
Message-ID: <c12873b2-d2e5-4fbc-987f-fa96cbe926da@kili.mountain>
References: <20230414125603.686123-1-dzm91@hust.edu.cn>
 <c3e0823b-2b03-4dab-b7cb-a8bc5151f0b1@kili.mountain>
 <011c00e7-c351-4331-8be4-1c184d5773e1@kili.mountain>
 <3ccc85bd-0541-4ffb-a207-dfc533a2c0aa@kili.mountain>
 <d49bb5a2-ed78-4b16-b7ea-b9c7748ca0e4@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d49bb5a2-ed78-4b16-b7ea-b9c7748ca0e4@kili.mountain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Apr 22, 2023 at 10:48:32PM +0300, Dan Carpenter wrote:
> The warnings from this are quite promising.

Well...  The results are over 90% false positives.  But there are still
probably 15 bugs in there.  The printk warning trick would probably
work.

regards,
dan carpenter

