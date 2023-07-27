Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 568A57648A0
	for <lists+linux-input@lfdr.de>; Thu, 27 Jul 2023 09:32:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233233AbjG0HcC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Jul 2023 03:32:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233264AbjG0Hbl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Jul 2023 03:31:41 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 699132D4E
        for <linux-input@vger.kernel.org>; Thu, 27 Jul 2023 00:20:17 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-98dfb3f9af6so78826466b.2
        for <linux-input@vger.kernel.org>; Thu, 27 Jul 2023 00:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690442416; x=1691047216;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fqOQsXekD6sFK6WYy17hOsZp5/7SJav2yrMJmcsMwVY=;
        b=JbzkFfQAD8bjHEJm+E5tZ41EFIRGnfKm5wY5f53MQBhQpdGM3vTr4dgnLV5WMYeHZE
         p9VxvyhmYqBwz/UqTpvS3Upu1osycLOtZRdYp3NQekWQWxbr3uQvnsqTsxOys9Fo49gv
         RzxCuINTx8tCki9+lzj8I88augJUCHoyHy5HMNr4fNG8m9rfBQRBQaG1mWw3gCrkZd0B
         XUgx3Hc1zscMcd+f8gZax0bXbSXSwnF71yv4JjnK7U67y0/pOYd5UpxuMP0WxjgEHhh/
         9KBS1Hdx77FGd/AI5605KcQPleT4M9ds2vpek/7VaOHVpyaKFN7v/7dIxtDn+8PLPgFp
         oAIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690442416; x=1691047216;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fqOQsXekD6sFK6WYy17hOsZp5/7SJav2yrMJmcsMwVY=;
        b=NsmQSyNK3VpiVkquPPkwmSrEkWSim3vhFhslxKwulv4ZPv/QfekOibnLIe8yvIKara
         Jf0xJfg1hRt1WHGvlB3EnACHRPc3u5y/69KGzoF+KIaaJJAb60FdVtEtJiwKrEG3348O
         NTu9rPjgqBYt1Sq1TUHUpMFndFPK4gwedSQT+psBLcYT8c0IVKnd6sEzeBIRaY56iCcP
         aONLWC/jOQqXfQ2qPSWr/OazzHCV+9YwGLOG8zSBXkeDaMMhlTQIPRMAr/6fuyNK3kiR
         owvdVsIktW6yBh54SeNphOKcNEZMQBdPlBAveUJmIo/m/3yNti3zW/kmkCiUpvJHtdM+
         zIwA==
X-Gm-Message-State: ABy/qLb+Y0oFCoFtS1zqHeI8nLMweA6DyZpEuZpiEjBtjTG7lXdXkyyq
        sPO9Et30RcvsGEBMLcN+bu/S+jJZ4Ljtobzk6sc=
X-Google-Smtp-Source: APBJJlH0jrNgLEoeZag63NmlA+d74+LDSnMgmUsHAoDTB3LniXqupxvPa61maXNWsNZ+1q5a7JpmTA==
X-Received: by 2002:aa7:c490:0:b0:522:5855:ee78 with SMTP id m16-20020aa7c490000000b005225855ee78mr953040edq.32.1690441670722;
        Thu, 27 Jul 2023 00:07:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id b21-20020a056402139500b005227e53cec2sm296242edv.50.2023.07.27.00.07.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 00:07:50 -0700 (PDT)
Message-ID: <5bb55bec-6a38-3a88-3fc1-79b12cfe7e02@linaro.org>
Date:   Thu, 27 Jul 2023 09:07:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/3] input: pm8xxx-vib: refactor to easily support new
 SPMI vibrator
Content-Language: en-US
To:     kernel test robot <lkp@intel.com>,
        Fenglin Wu <quic_fenglinw@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        agross@kernel.org, andersson@kernel.org,
        dmitry.baryshkov@linaro.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        quic_collinsd@quicinc.com, quic_subbaram@quicinc.com,
        quic_kamalw@quicinc.com, jestar@qti.qualcomm.com
References: <20230725054138.129497-2-quic_fenglinw@quicinc.com>
 <202307251741.PMtlVAgD-lkp@intel.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <202307251741.PMtlVAgD-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 25/07/2023 12:01, kernel test robot wrote:
> Hi Fenglin,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on dtor-input/next]
> [also build test WARNING on dtor-input/for-linus linus/master v6.5-rc3 next-20230725]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Fenglin-Wu/input-pm8xxx-vib-refactor-to-easily-support-new-SPMI-vibrator/20230725-134504
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
> patch link:    https://lore.kernel.org/r/20230725054138.129497-2-quic_fenglinw%40quicinc.com
> patch subject: [PATCH v3 1/3] input: pm8xxx-vib: refactor to easily support new SPMI vibrator
> config: x86_64-buildonly-randconfig-r002-20230725 (https://download.01.org/0day-ci/archive/20230725/202307251741.PMtlVAgD-lkp@intel.com/config)
> compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> reproduce: (https://download.01.org/0day-ci/archive/20230725/202307251741.PMtlVAgD-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307251741.PMtlVAgD-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> drivers/input/misc/pm8xxx-vibrator.c:190:17: warning: cast to smaller integer type 'enum pm8xxx_vib_type' from 'const void *' [-Wvoid-pointer-to-enum-cast]
>            vib->hw_type = (enum pm8xxx_vib_type)of_device_get_match_data(dev);
>                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    1 warning generated.
> 

Remember to fix all the warnings.

Best regards,
Krzysztof

