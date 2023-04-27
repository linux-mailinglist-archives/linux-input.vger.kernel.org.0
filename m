Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51A066F09E4
	for <lists+linux-input@lfdr.de>; Thu, 27 Apr 2023 18:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244122AbjD0QbO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Apr 2023 12:31:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243524AbjD0QbL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Apr 2023 12:31:11 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E19010EA
        for <linux-input@vger.kernel.org>; Thu, 27 Apr 2023 09:31:10 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6a5e2289965so6810037a34.3
        for <linux-input@vger.kernel.org>; Thu, 27 Apr 2023 09:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682613069; x=1685205069;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YgsQjPYSA4x9EUAST26pLIMgzwk5/fmUNEDBBVE+P4A=;
        b=H/F2jXQhEspNf2OSg1QdhIunBBlXl0Bx9YZ26gqXk+Gs3zr1BMEJlTeL5k9J8P05bu
         GUKysimt65dWa99YmJSJVeBANdqJjBXt3KAmR09VKLgLmOByA2d4V1DF8VdJyCqx0WVy
         wTTi+XjWh1gjMd/UXjdaOWsjrs8U9CTZzav9EEzBxRv7ygMPsrF21nAtzIqBy0hd6bx/
         rVCC5lep6mjx7P7X7168S1kDfCavrY2GvkPNq436Edjl3h7XLL4NyZMlDGY38BE+C6i9
         hP37oyOZN9vjSf9M67zNMdGLB4TBOx9IpsMXcGi+Kf/odO+qLqN4KuSt+YvvfhtsbHfe
         wshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682613069; x=1685205069;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YgsQjPYSA4x9EUAST26pLIMgzwk5/fmUNEDBBVE+P4A=;
        b=KOkMUldrmvL5HnirUyLgYEAo6/yv/+3Gft6q0Al0xISNrslTphpaqd8B3NHfxw9uS0
         E44lr8booJDXt9GQ7gPXKKfMFkuD8wkQdDDVyXHAf7CgLfEemA+aO9kUq+2i1Pnhi29d
         Sll4WHRdMEY0PlRynt/JBViO+oMqhxLaFBekYIQ06EFTqwZUTeK9fM8Hx0G7OB2Hw/Qy
         +xpiJbMAagQfubP0C2F/blUqO6ij0KDs59wu+lN0vrnXf+mn8B1C7YjUDao3M6+Ve2nl
         iEx1pJiSA062HPtUq1x4G8JFohy206gzBzX2PEgHRZyPa9fpeTQkk+k0WRbE2FEt2LFG
         QLbw==
X-Gm-Message-State: AC+VfDyjAfQ3666gfae26eFWFOQbM4jr7RzS6tGvtha3XdaihCWOzcuu
        s1K1EtoGDh415QiKlJ3g6ZnRRowjKuG5N8mUhfI=
X-Google-Smtp-Source: ACHHUZ4ZWPxxNS1Y5SSo3pDTzI3Cin5siRdLfLJT7PY3lt+Mg1tieNMQ61YcFP1SGBY5C2W7bo73rMjSg69Nd/lxy4o=
X-Received: by 2002:a05:6871:6b81:b0:188:10b8:5358 with SMTP id
 zh1-20020a0568716b8100b0018810b85358mr1352670oab.16.1682613069193; Thu, 27
 Apr 2023 09:31:09 -0700 (PDT)
MIME-Version: 1.0
Sender: mrsthereseninna@gmail.com
Received: by 2002:a05:6358:2489:b0:f1:be9a:c0c5 with HTTP; Thu, 27 Apr 2023
 09:31:08 -0700 (PDT)
From:   Dr Lisa Williams <lw4666555@gmail.com>
Date:   Thu, 27 Apr 2023 09:31:08 -0700
X-Google-Sender-Auth: 2oW4L4Na4Ml9J-VMpu6qL-XIbgg
Message-ID: <CAKVHDg8feap+6aWmD4o2bHD1DZqj_4PvghR9nh0Cm1DaYdQB=A@mail.gmail.com>
Subject: Hi,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

My name is Dr. Lisa Williams, from the United States, currently living
in the United Kingdom.

I hope you consider my friend request. I will share some of my photos
and more details about me when I get your reply.

With love
Lisa
