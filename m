Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC26E65856E
	for <lists+linux-input@lfdr.de>; Wed, 28 Dec 2022 19:03:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234868AbiL1SC6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Dec 2022 13:02:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234926AbiL1SCj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Dec 2022 13:02:39 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 408FE1A044
        for <linux-input@vger.kernel.org>; Wed, 28 Dec 2022 10:01:34 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id ay40so11705117wmb.2
        for <linux-input@vger.kernel.org>; Wed, 28 Dec 2022 10:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6GZ1RXnzTK0yPQ2dltlGM0mfb5PCut5tsgqezDikh60=;
        b=LXtCzD7Z3y1jgVy5IAL9b7rGhx/03zdoF7xjN+cuTmPJ5RONGYW9rp8Mv6gHk9piNs
         syiaQbdKlRPpGsDhgV5sQcJ2wfFiVPeUd3WOv3Ekkw4UJp5vGSFrbGYNv8PGUa6PXJaq
         SZ8UzGJcaiu8hgIAmNbxnOwQABXsqaQQQfHgD2Ljv6hvYqjcyAJhWnRkHwyZgoK+rslP
         yALmlobkQMWsdvyb9S4rVKIp9l2KdtMu5haZKu67zIjrnWJxGCg2zZYaqu0KnjPWsEPe
         ArVxSaayaZvQnCfF24SPgQqk/FolP2yb4iOOgiXKUh111bhxM+djnmzSIjZVkyCcVU0V
         oK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GZ1RXnzTK0yPQ2dltlGM0mfb5PCut5tsgqezDikh60=;
        b=fnpGpga1aa6Wznb4gmbaNM3aYbZLmECQtWWGTGWlIgtPNbiB+cGXqGOc8MSeRz6c0w
         XCkvVMC0P9r3N0ig3Fc6q1i2ERKx/7pPp5gfiWjFgkq8w49pSRmL3S9UfJz2fEG/p2yN
         cmDwlC3qk9rKRJFKpKW8p6kmHKYBHyhW3ZZ6fvIO8zq5farMRKuqKhEdWvGZsb80KqLT
         HK4o0g4/fKvp0Hol9eAdgAciJMK6yYTOh4r1qWnoa4PkjkIxVPpr2EPR60Oig8jhhXKz
         5Ajfbh00OOMjW+rhKZj2Siq8+qQEJe5spVDohA0G7Y4nouzm906NdxOPyCgZ4XDWwWqm
         9Kvw==
X-Gm-Message-State: AFqh2kpBOZPs58IMYZNHsnfkICDDiBNB771B2uS9zSUQFHKJt0AEikj/
        QpLnU/JraXNpIm+WQuPbphs09azSbK3I3g==
X-Google-Smtp-Source: AMrXdXuUkpaK2g3Htd8jUWFNlr1tZdD+YIHDfmb/QEREK3NrewzOs+OKpcYomnFU5XrHtddZY/m3IA==
X-Received: by 2002:a7b:c4da:0:b0:3d3:864a:1173 with SMTP id g26-20020a7bc4da000000b003d3864a1173mr17967280wmk.18.1672250492639;
        Wed, 28 Dec 2022 10:01:32 -0800 (PST)
Received: from localhost (net-93-66-65-174.cust.vodafonedsl.it. [93.66.65.174])
        by smtp.gmail.com with ESMTPSA id a1-20020a05600c348100b003b47b80cec3sm26097554wmq.42.2022.12.28.10.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 10:01:31 -0800 (PST)
Date:   Wed, 28 Dec 2022 19:01:30 +0100
From:   Alain Carlucci <alain.carlucci@gmail.com>
To:     Roderick Colenbrander <thunderbird2k@gmail.com>
Cc:     linux-input@vger.kernel.org, jikos@kernel.org
Subject: Re: [PATCH] HID: sony: Fix division by zero
Message-ID: <20221228180130.47ix3afwbv4bmqfc@ananas>
References: <20221226000722.2xgbvsnrl6k7f7tk@ananas>
 <CAEc3jaDf_TqzxRt3m=OscjLcg=L-jYhNq2r7jEyD6Z1pFo3NRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAEc3jaDf_TqzxRt3m=OscjLcg=L-jYhNq2r7jEyD6Z1pFo3NRA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Roderick,

On Tue, Dec 27, 2022 at 08:17:15AM -0800, Roderick Colenbrander wrote:
>Thanks for sharing your patch. Others have encountered similar issues.
>This is the case when the calibration coefficients are incorrect.
>These are hard programmed into devices from the factory. It are
>typically clone devices, which don't implement all DS4 functionality
>properly.

I cannot ensure it's an original DS4 but it really seems so.
The board is a JDM-055 with a MT3610N, but instead of a BST-BMI270 (as
reported on a reverse-engineered schematic[1]) it has a "N339(CCF)".
I can't find any datasheet or specification of that chip.
I'll provide few images of the board for reference[2].
Do you think it's a clone?

>Can you try printing all the variables (gyro_speed_plus,..
>acc_z_minus) for your device as decimal numbers from the
>get_calibration_data function?

Sure, here is the output:
gyro_pitch_plus=0 gyro_pitch_minus=0 gyro_yaw_plus=0 gyro_yaw_minus=0
gyro_roll_plus=0 gyro_roll_minus=0 gyro_speed_plus=0
gyro_speed_minus=0 acc_x_plus=0 acc_x_minus=0 acc_y_plus=0
acc_y_minus=0 acc_z_plus=0 acc_z_minus=0 

Probably it has communication issues with the IMU.
This one is a joypad with multiple issues I'm trying to solve one by one.

By the way, do you know if there are tools for linux to test all the
functionalities of the DS4? I would be interested to read IMU values,
test audio, vibration and touchpad.

Thanks,
Alain

[1] https://www.acidmods.com/RDC/DS4/JDM-055/1-982-707-31%20small/JDM-055__(31)_SOME_VALUES.pdf
[2] https://imgur.com/a/tckVWKR
