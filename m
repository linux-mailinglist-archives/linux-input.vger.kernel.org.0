Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5927960509D
	for <lists+linux-input@lfdr.de>; Wed, 19 Oct 2022 21:40:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbiJSTke (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 Oct 2022 15:40:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230315AbiJSTkb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 Oct 2022 15:40:31 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C927371B4;
        Wed, 19 Oct 2022 12:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1666208426;
        bh=hK/WYgdBJ9DDoiv5VK5AkPFkbq2bs+zp695HMZjr2ik=;
        h=X-UI-Sender-Class:References:In-Reply-To:From:Date:Subject:To:Cc;
        b=GjWbN6ZXickaUb9VSo6DXHkN8q7zkCv4eILARW6EUK4PI8y5JTKoq+gGglblqsg8w
         Jutx70UPgIg6bH1FQRPKyXNLRfDu5+iNB7zbBKzk3pMw3ha62ajElunz756lvtJDyY
         3gxWHu0tvrLVoCOMeaYCXMdm1BjG+kqUOsU44b08=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from mail-ed1-f54.google.com ([209.85.208.54]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MO9z7-1oRdkB25YP-00ObD2; Wed, 19 Oct 2022 21:40:26 +0200
Received: by mail-ed1-f54.google.com with SMTP id r14so26801511edc.7;
        Wed, 19 Oct 2022 12:40:26 -0700 (PDT)
X-Gm-Message-State: ACrzQf28zV4W6udvgvpV6rB6Jd4EoVpuPFnsgNoWOF+hTPu9jFHpCs2y
        IfvyehBELoft0EdmET1DcCjT3BLHGz+XbdBjD98=
X-Google-Smtp-Source: AMsMyM5OuA0l6x3iqaAD7ZXEr7Eq43dy294gZvwNqcl+PM07Q9C/kajAOSEJaLs4501pk3MgcLohyhky7klvopWUTLM=
X-Received: by 2002:a05:6402:440f:b0:45d:297b:c70a with SMTP id
 y15-20020a056402440f00b0045d297bc70amr9100037eda.187.1666208426153; Wed, 19
 Oct 2022 12:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <Y1AVDck5sQf8+QFX@rowland.harvard.edu> <b1309e015d07abc47a2cf987e229a87f533430b5.camel@hadess.net>
In-Reply-To: <b1309e015d07abc47a2cf987e229a87f533430b5.camel@hadess.net>
From:   Andreas Bergmeier <abergmeier@gmx.net>
Date:   Wed, 19 Oct 2022 21:40:14 +0200
X-Gmail-Original-Message-ID: <CABfF9mP90VyDk9BwCA8uZPDHCStwE18s+EM=EeQyKGhs_WNtxQ@mail.gmail.com>
Message-ID: <CABfF9mP90VyDk9BwCA8uZPDHCStwE18s+EM=EeQyKGhs_WNtxQ@mail.gmail.com>
Subject: Re: Litra Glow on Linux
To:     Bastien Nocera <hadess@hadess.net>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        linux-input@vger.kernel.org,
        USB mailing list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:O/ZMyxIEfNnw+ryC7IJsbQiQUZQ0rHd71l9ucM0/nWt+gLrP2Nd
 7px7SwIlVIe6sFoRblR/A/MpDgQ25QMoST0Au2xxqSwdeg7dc9hM05su63qCa5ad9t2jDC+
 EOLDSmG08CPb/kM+ORK4FfI9UxjPeYdjKRZCru7EnTuXx3XPmm8yEH2QMWmovXC9ROtNVl+
 9s6AAxZdXebPKOmCGueuQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:X8ncLm57Hxk=:Hf4vfUZNQ8DEZcM2ThuR6P
 umFDtfcXl0dS8W+B5i7Lej/FAoQ4dl11/zR/REx8v3xN8ZlI6mxki92Mws9QCGELp+UZPPllf
 1EJHWx6LxDkgGxLi7W898KbH+ImRncd+wKiCk3teW/iiqG5Prf9J1PWHLPV7yozpsmhe6ZgKL
 KForPktvi7TIwAOSifcd9+E6h9DTq15Lym/yzcWNxl5x7MiEydazbEZp8GE5kiYoRUkM4gM5P
 o63xc6tesEIPn+LpA3QaiDYGeFZlGDo3qJbnLe7Hr+JebNGqfeILVLq2JJkv2QXpDbcY2cbJi
 Vr72pzfEwWxQZ60XivTnUSS1Eqw+rBmsOxBJHJuEqDxe5vteZlm6BxZW4F98wFCVd0MHa6+7s
 gSuL9hAMBzGwUuXTSopP9VaOXIBF4hS1fkoYJSHG1R4mwO6OE7WwbKkca4P+8TWV/NyLIFmm8
 Miz/qHj0UnQnOzSLyDdBqrANY1s8+Fkv2XsodtqQVlLyLKRcT5Ep8OHZ4n9qEssKV/20pjIX2
 /CYKgw6le2FH/dfF7LbqeTpWVhjHMfCphAyHa6SbSQUfc/g0ijsbfiS+X6JW0NOXeaGAJ26Ij
 843uF1iI9WNuGZfnPNsMRGVO5DGCOZZEeyhdgZj0/YkIfSphpWJ8X99st1pYeF3Mif42lDz6t
 DB1T53c4q+o5kbGFghyKbrPog4uiLaAs+dL3FnRlqx13eA7LUchh52TaScWASbJIZRx2L3AZf
 bTxGI/Wbs/K984MdOMbJ/7O/2aH1PXvJpRZqcbKXHXrSjNBBFmFSSCMpIqKlCLvegJq1A+l2K
 QO3jiEjcjTgiJMzbxVgdyROQTUy0+Qg1pxQISkE6aCbuCmgxuPCUmpLiUJqqT244UL+6glJKu
 DFndp+GVzCuMMFe9d/uxottjzFBfTEjPS8m/fu0GCiJabR8tBEG4BMQVbHO0wGy3x9MaeVOkM
 t9gejhM8XMJksi7CqzJk3UzxXVJmE4JPPFDQQNt+OghNigz9z48fSR/TMfs8OQzIbpOiCRy2d
 xakAhg0WnE1j9op8LQg75ClyN1pbhjoBPiW5+t+k9JIDSGxP46YNRnmCQ3oKFWVInGsvYkWwD
 qNKFjVsQCdDhtrc4BHGzV9nFfvX8XAQz/EW55QIRgE+6+w9RvjFhld6JBbWzwkuVmloLucFp6
 7VKaC/CgZJwoA/7c0FvPGsyVWP1r7DKmcZZACAlCIUHiPmRYd6MlMsTuYFtu9WSFcPLRH9sBe
 lr97jkD9f/VObdv7lV1zxhjGRzjjr98cj1uuwy3TE9UkbGuNR8f3VZwfyKyNSGHMrN1HO9uNd
 iu38VPmJADDRl2yRjOVzf71cc5dbijfnkDYLeu4jzpKUVSOcWthqNGhQ7eyQFtCdmqU3gdOO0
 +iuNMy5jNfioXWO5yDUiiSW3b17jxV1BsK7DRr6Q4ieiNZlwNahHKXml00Eemn2+ZK7h9lDfg
 TL3NGIt+z8cInOrGqWGOvXaINjrwd0uywnLdgNlLgyKfIZapm09OdbEQPy59X2U3w4H5Dy1fM
 NiikRAdGZNJKQ0ESFYg1wwAiy9AM9KP4X2zFdA3QPc8C1
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 19 Oct 2022 at 17:49, Bastien Nocera <hadess@hadess.net> wrote:
>
> On Wed, 2022-10-19 at 11:17 -0400, Alan Stern wrote:
> > Via (hardware) buttons you can switch the device on, regulate the
> > color temperature as well as the brightness.
> > I know of no way to fully control the device from my computer and
> > would like to change that.
>
> Anything that those libraries and tools can't do?
>
> https://github.com/search?q=litra+glow

From the code I have looked into it seems like some Mac libraries
might be able to do all that. Why, I am not yet clear on.
I have a _feeling_ that maybe Windows and macOS do a different HID
mapping/processing than Linux.
