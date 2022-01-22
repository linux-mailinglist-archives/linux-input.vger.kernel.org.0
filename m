Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C8B8496CAD
	for <lists+linux-input@lfdr.de>; Sat, 22 Jan 2022 14:59:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233699AbiAVN7Z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 22 Jan 2022 08:59:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231328AbiAVN7Z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 22 Jan 2022 08:59:25 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB879C06173B
        for <linux-input@vger.kernel.org>; Sat, 22 Jan 2022 05:59:24 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id k18so5002127wrg.11
        for <linux-input@vger.kernel.org>; Sat, 22 Jan 2022 05:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=0eFcujW+1shbyFjExKGvmtmNSoUklCOLqIbRq7h2PDY=;
        b=iH5V7QJnyaLzAL8TPXz3XP7PCnK6ycFtFm/D85lnpoeY1j3wFFKue76tM3x+tSoiIK
         WKB6yVlnXf0MHOEoWPdxb5CZq+KA0lFDzsfwjl4y/vgss/jUtYGjvj7Ggk5jIlWgpKi+
         pllwGNwphkCCfW+OR84S//82RcOMLsWWYZ0BhqizyrPKwOmmFdI0HONbx1mZ1EyZ2m+8
         TNTbOast8U/qj50VwevAfv2BnUTtWgffsKYeF9O0TkzHGll3tvF/PfWJSmYTwFF7mEQE
         LuazNi0KPr1v4/NQJNHKc0pfjTRf03/osKuaVo986qTA47S3KeHL5b4Dcrv5F3d/ORdy
         FBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0eFcujW+1shbyFjExKGvmtmNSoUklCOLqIbRq7h2PDY=;
        b=LlNn5z8k2oDA4EcfeMwnroAW94pLxeZklRYr2mIuI7/XqP999snfQnt33rRq5emSxb
         Nd1YpLzKVW7D/a7y1G8fKCayme5Zs7DQbCGanclqxBVMfkCaB+LC1JYNaGBNps5b5bX8
         RjiJcxnU2Zga7VGRb2oEb4CHOyix4uYzRzpoQUlWz+NKGmLavFak7HrYW+L9jbOsOoqX
         3EJ21zYRnA66G9bUgP9SZTAWXJN6WHVlPyQVqrsFsKwDt20C3v3c2IGVxCYjqDLNTgDq
         rWl2Ya79hOs4CT990OVlm35ydZpzdA0U15ws6JASy32J0RmYLCBS8D8Po0phbod/RoWe
         ixEw==
X-Gm-Message-State: AOAM5316CXNhxIv9i7FCOZW+kFFUJeOQV9OIkjYvccg1BJ1p9dOO5Fi+
        XvH+HZ847eg1zTv3zzHRLFsb/nodoVY=
X-Google-Smtp-Source: ABdhPJzDvCSyt/6U5AuJxi8ZO9zGPdSsQ2mXys+XgXfUpS1D9CaDdaTIRNpNV7LJJS2h/z02O0TE0g==
X-Received: by 2002:a5d:430e:: with SMTP id h14mr7313680wrq.99.1642859963337;
        Sat, 22 Jan 2022 05:59:23 -0800 (PST)
Received: from ?IPV6:2a02:8109:1a3f:a0e0::5516? ([2a02:8109:1a3f:a0e0::5516])
        by smtp.gmail.com with ESMTPSA id c10sm8931683wrq.11.2022.01.22.05.59.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Jan 2022 05:59:22 -0800 (PST)
Message-ID: <9dc2c45c-70cd-93d9-5be4-6589b3744221@gmail.com>
Date:   Sat, 22 Jan 2022 14:59:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] HID: apple: Set the tilde quirk flag on the Wellspring 5
 and later
Content-Language: en-US
To:     Alex Henrie <alexhenrie24@gmail.com>, linux-input@vger.kernel.org,
        jkosina@suse.cz
References: <20220116230158.29596-1-alexhenrie24@gmail.com>
From:   Markus Wageringel <markus.wageringel@gmail.com>
In-Reply-To: <20220116230158.29596-1-alexhenrie24@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 1/17/22 00:01, Alex Henrie wrote:
> Markus reports that his 2011 MacBook with a German ISO keyboard (USB
> product code 05ac:0246, HID country code 13) has the tilde key quirk.
> Seeing as all of the standalone Apple ISO keyboards since about 2008
> have the quirk, it seems reasonable to assume that once the integrated
> laptop keyboards started having the quirk, they likewise never stopped
> having it.

Thank you for the patch. I have tested the patch on top of kernel 5.16.2 
and can confirm that it fixes the problem on my hardware.

Markus
