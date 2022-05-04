Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFC0451A2F3
	for <lists+linux-input@lfdr.de>; Wed,  4 May 2022 17:02:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343652AbiEDPF6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 May 2022 11:05:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351740AbiEDPFy (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 May 2022 11:05:54 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B38937BFE;
        Wed,  4 May 2022 08:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651676532; x=1683212532;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LZOSHgzaH7gLto7Bh3nkfkwcqKHDQok+ILvZzSVOYjg=;
  b=ZjgxmahrcAphXHDP1RXUPU+pnXKdpQsqQPnLzNV7UM3OPiU6xXd4Vzex
   e/p/EbpdpsLxw1qVEI6Csf9P89YI3KD0JCdTALl56HzxEBrYt83VL+DcG
   Sg7jzUDdfdI6ayaxiKfTzaLMDTNAoG3gRvF5+FSGNWGmLbVSYLqdlVYaI
   f7sahqqDAhoVXB0IDS+AuCAP8zebVKZ1lpiv7KtntNJwq7snWX6bYVqtY
   +81eLaaZGy/2KaoJer3qFaAB+wUfhK8UglXzJAMaaJXn4kioLsgl8Zc+s
   MW8XV8g5QPXMnQeiwusekmVxtp1EUOPxkIeAhT8qR+0zbOztf/+SXiRaW
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="247700267"
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; 
   d="scan'208";a="247700267"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2022 08:02:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; 
   d="scan'208";a="811155238"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 04 May 2022 08:02:06 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nmGVx-000BSl-JB;
        Wed, 04 May 2022 15:02:05 +0000
Date:   Wed, 4 May 2022 23:01:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Gireesh.Hiremath@in.bosch.com, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org, bcousson@baylibre.com,
        tony@atomide.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, dmitry.torokhov@gmail.com,
        mkorpershoek@baylibre.com, davidgow@google.com,
        m.felsch@pengutronix.de, swboyd@chromium.org,
        fengping.yu@mediatek.com, y.oudjana@protonmail.com,
        rdunlap@infradead.org, colin.king@intel.com
Cc:     kbuild-all@lists.01.org, sjoerd.simons@collabora.co.uk,
        VinayKumar.Shettar@in.bosch.com,
        Govindaraji.Sivanantham@in.bosch.com, anaclaudia.dias@de.bosch.com
Subject: Re: [PATCH 2/4] Input: mt-matrix-keypad: Add Bosch mt matrix keypad
 driver
Message-ID: <202205042204.lz58BhXF-lkp@intel.com>
References: <20220504105254.1576-2-Gireesh.Hiremath@in.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220504105254.1576-2-Gireesh.Hiremath@in.bosch.com>
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tmlind-omap/for-next]
[also build test WARNING on next-20220504]
[cannot apply to dtor-input/next robh/for-next balbi-usb/testing/next v5.18-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Gireesh-Hiremath-in-bosch-com/ARM-dts-am335x-Guardian-switch-to-AM33XX_PADCONF-pinmux-macro/20220504-185623
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git for-next
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20220504/202205042204.lz58BhXF-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8dae1bf10aa8e74feb1bca5eb708e98e9492a587
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Gireesh-Hiremath-in-bosch-com/ARM-dts-am335x-Guardian-switch-to-AM33XX_PADCONF-pinmux-macro/20220504-185623
        git checkout 8dae1bf10aa8e74feb1bca5eb708e98e9492a587
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/input/keyboard/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/input/keyboard/mt_matrix_keypad.c:51:6: warning: no previous prototype for 'init_phase' [-Wmissing-prototypes]
      51 | void init_phase(struct mt_matrix_keypad_platform_data *pdata)
         |      ^~~~~~~~~~
>> drivers/input/keyboard/mt_matrix_keypad.c:58:6: warning: no previous prototype for 'button_init' [-Wmissing-prototypes]
      58 | void button_init(struct button *btn, bool btn_hw_state, int key)
         |      ^~~~~~~~~~~
>> drivers/input/keyboard/mt_matrix_keypad.c:70:1: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]
      70 | const struct button_states get_button_state(struct button *btn)
         | ^~~~~
>> drivers/input/keyboard/mt_matrix_keypad.c:70:28: warning: no previous prototype for 'get_button_state' [-Wmissing-prototypes]
      70 | const struct button_states get_button_state(struct button *btn)
         |                            ^~~~~~~~~~~~~~~~
>> drivers/input/keyboard/mt_matrix_keypad.c:75:17: warning: no previous prototype for 'get_and_clear_events' [-Wmissing-prototypes]
      75 | union typeEvent get_and_clear_events(struct button *btn)
         |                 ^~~~~~~~~~~~~~~~~~~~
>> drivers/input/keyboard/mt_matrix_keypad.c:84:9: warning: no previous prototype for 'get_btn_index' [-Wmissing-prototypes]
      84 | uint8_t get_btn_index(struct mt_matrix_keypad_platform_data *pdata, int btn_key)
         |         ^~~~~~~~~~~~~
>> drivers/input/keyboard/mt_matrix_keypad.c:95:6: warning: no previous prototype for 'set_btn_state_by_hw' [-Wmissing-prototypes]
      95 | void set_btn_state_by_hw(struct button *btn, bool boButtonState)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/input/keyboard/mt_matrix_keypad.c:100:6: warning: no previous prototype for 'check_button_changes' [-Wmissing-prototypes]
     100 | bool check_button_changes(struct button *btn)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/input/keyboard/mt_matrix_keypad.c:124:1: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]
     124 | const struct button_states
         | ^~~~~
>> drivers/input/keyboard/mt_matrix_keypad.c:125:1: warning: no previous prototype for 'get_btn_id_state' [-Wmissing-prototypes]
     125 | get_btn_id_state(const struct mt_matrix_keypad_platform_data *pdata,
         | ^~~~~~~~~~~~~~~~
>> drivers/input/keyboard/mt_matrix_keypad.c:135:1: warning: no previous prototype for 'get_and_clear_btn_events' [-Wmissing-prototypes]
     135 | get_and_clear_btn_events(const struct mt_matrix_keypad_platform_data *pdata,
         | ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/input/keyboard/mt_matrix_keypad.c:144:6: warning: no previous prototype for 'button_hdl_init' [-Wmissing-prototypes]
     144 | void button_hdl_init(struct mt_matrix_keypad_platform_data *pdata)
         |      ^~~~~~~~~~~~~~~
>> drivers/input/keyboard/mt_matrix_keypad.c:171:6: warning: no previous prototype for 'on_button_event' [-Wmissing-prototypes]
     171 | bool on_button_event(const struct mt_matrix_keypad_platform_data *pdata,
         |      ^~~~~~~~~~~~~~~
>> drivers/input/keyboard/mt_matrix_keypad.c:196:6: warning: no previous prototype for 'process_button_events' [-Wmissing-prototypes]
     196 | void process_button_events(const struct mt_matrix_keypad_platform_data *pdata,
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/input/keyboard/mt_matrix_keypad.c:219:6: warning: no previous prototype for 'update_buttons' [-Wmissing-prototypes]
     219 | void update_buttons(struct mt_matrix_keypad_platform_data *pdata,
         |      ^~~~~~~~~~~~~~


vim +/init_phase +51 drivers/input/keyboard/mt_matrix_keypad.c

    43	
    44	static bool
    45	get_gpio_line_value(const struct mt_matrix_keypad_platform_data *pdata,
    46			    int row);
    47	static void
    48	activate_line_driving(const struct mt_matrix_keypad_platform_data *pdata,
    49			      int line, bool on);
    50	
  > 51	void init_phase(struct mt_matrix_keypad_platform_data *pdata)
    52	{
    53		pdata->phase_state.phase_prepare = -1;
    54		pdata->phase_state.phase_start = 0;
    55		pdata->phase_state.phase_update_button = pdata->num_line_gpios;
    56	}
    57	
  > 58	void button_init(struct button *btn, bool btn_hw_state, int key)
    59	{
    60		btn->state.boPrevious = btn_hw_state;
    61		btn->state.boCurrentStateOfHw = btn_hw_state;
    62		btn->state.boCurrentStateOfSw = false;
    63		btn->state.boCurrent = btn_hw_state;
    64		btn->state.boEnabled = true;
    65		btn->state.boStateAtInit = btn_hw_state;
    66		btn->event.ui8Register = 0;
    67		btn->key = key;
    68	}
    69	
  > 70	const struct button_states get_button_state(struct button *btn)
    71	{
    72		return btn->state;
    73	}
    74	
  > 75	union typeEvent get_and_clear_events(struct button *btn)
    76	{
    77		union typeEvent beTemp = btn->event;
    78	
    79		btn->event.ui8Register = 0;
    80	
    81		return beTemp;
    82	}
    83	
  > 84	uint8_t get_btn_index(struct mt_matrix_keypad_platform_data *pdata, int btn_key)
    85	{
    86		uint8_t i;
    87	
    88		for (i = 0; i < pdata->num_of_button; i++) {
    89			if (pdata->button_array[i].key == btn_key)
    90				break;
    91		}
    92		return i;
    93	}
    94	
  > 95	void set_btn_state_by_hw(struct button *btn, bool boButtonState)
    96	{
    97		btn->state.boCurrentStateOfHw = boButtonState;
    98	}
    99	
 > 100	bool check_button_changes(struct button *btn)
   101	{
   102		btn->state.boPrevious = btn->state.boCurrent;
   103		btn->state.boCurrent =
   104			btn->state.boCurrentStateOfHw || btn->state.boCurrentStateOfSw;
   105	
   106		/* Check if Button is pressed */
   107		if ((btn->state.boPrevious == false) &&
   108		    (btn->state.boCurrent == true)) {
   109			btn->event.status.boPressed = true;
   110		}
   111	
   112		/* Check if Button is released */
   113		else if ((btn->state.boPrevious == true) &&
   114			 (btn->state.boCurrent == false)) {
   115			btn->event.status.boReleased = true;
   116		}
   117	
   118		if (btn->event.ui8Register != 0)
   119			btn->event.status.boGlobalChanged = true;
   120	
   121		return btn->event.status.boGlobalChanged;
   122	}
   123	
 > 124	const struct button_states
 > 125	get_btn_id_state(const struct mt_matrix_keypad_platform_data *pdata,
   126			 int btn_index)
   127	{
   128		if (btn_index < pdata->num_of_button)
   129			return get_button_state(&pdata->button_array[btn_index]);
   130		else
   131			return get_button_state(&pdata->button_array[0]);
   132	}
   133	
   134	union typeEvent
 > 135	get_and_clear_btn_events(const struct mt_matrix_keypad_platform_data *pdata,
   136				 int btn_index)
   137	{
   138		if (btn_index < pdata->num_of_button)
   139			return get_and_clear_events(&pdata->button_array[btn_index]);
   140		else
   141			return get_and_clear_events(&pdata->button_array[0]);
   142	}
   143	
 > 144	void button_hdl_init(struct mt_matrix_keypad_platform_data *pdata)
   145	{
   146		int row, col, index;
   147		int i;
   148	
   149		pdata->scan_phase = pdata->phase_state.phase_prepare;
   150		pdata->intialize_buttons = true;
   151	
   152		/* Init Button Objects, will be reinited once states are captured */
   153		i = 0;
   154		for (row = 1; row < pdata->num_line_gpios; row++)
   155			for (col = 0; col < row; col++) {
   156				index = (row * pdata->num_line_gpios) + col;
   157				if (pdata->button_matrix[index] !=
   158				    pdata->button_matrix[0]) {
   159					if (i < pdata->num_of_button) {
   160						button_init(
   161							&pdata->button_array[i], false,
   162							pdata->button_matrix[index]);
   163						i++;
   164					}
   165				}
   166			}
   167	
   168		pr_debug("[%s]: %s Done\n", MODULE_NAME, __func__);
   169	}
   170	
 > 171	bool on_button_event(const struct mt_matrix_keypad_platform_data *pdata,
   172			     int btn_index, union typeEvent btn_event,
   173			     struct input_dev *input_dev)
   174	{
   175		bool any_btn_served = true;
   176		unsigned int key_code = 0;
   177		int key_value = 0;
   178	
   179		key_code = pdata->button_array[btn_index].key;
   180	
   181		if (btn_event.status.boPressed) {
   182			key_value = 1;
   183			pr_debug("[%s]:%d Pressed\n", MODULE_NAME, key_code);
   184		}
   185	
   186		if (btn_event.status.boReleased) {
   187			key_value = 0;
   188			pr_debug("[%s]:%d Released\n", MODULE_NAME, key_code);
   189		}
   190	
   191		input_report_key(input_dev, key_code, key_value);
   192		input_sync(input_dev);
   193		return any_btn_served;
   194	}
   195	
 > 196	void process_button_events(const struct mt_matrix_keypad_platform_data *pdata,
   197				   struct input_dev *input_dev)
   198	{
   199		int btn_index;
   200		bool any_btn_served = false;
   201	
   202		for (btn_index = 0; btn_index < pdata->num_of_button; btn_index++) {
   203			const union typeEvent beEvent =
   204				get_and_clear_btn_events(pdata, (int)btn_index);
   205	
   206			if (beEvent.status.boGlobalChanged) {
   207				const struct button_states bsState =
   208					get_btn_id_state(pdata, (int)btn_index);
   209	
   210				if (bsState.boEnabled) {
   211					any_btn_served |=
   212						on_button_event(pdata, (int)btn_index,
   213								beEvent, input_dev);
   214				}
   215			}
   216		}
   217	}
   218	
 > 219	void update_buttons(struct mt_matrix_keypad_platform_data *pdata,
   220			    struct input_dev *input_dev)
   221	{
   222		if (pdata->scan_phase == pdata->phase_state.phase_prepare) {
   223			pdata->scan_phase = pdata->phase_state.phase_start;
   224			activate_line_driving(pdata, (int)pdata->scan_phase, true);
   225		} else if (pdata->scan_phase ==
   226			   pdata->phase_state.phase_update_button) {
   227			bool btn_changes_occured = false;
   228			int btn_index;
   229	
   230			if (pdata->intialize_buttons) {
   231				int i;
   232	
   233				pdata->intialize_buttons = false;
   234	
   235				for (i = 0; i < pdata->num_of_button; i++) {
   236					const bool btn_curr_hw_state =
   237						get_button_state(
   238							&pdata->button_array[i])
   239							.boCurrentStateOfHw;
   240					button_init(&pdata->button_array[i],
   241						    btn_curr_hw_state,
   242						    pdata->button_array[i].key);
   243				}
   244			}
   245	
   246			for (btn_index = 0; btn_index < pdata->num_of_button;
   247			     btn_index++) {
   248				btn_changes_occured |= check_button_changes(
   249					&pdata->button_array[btn_index]);
   250			}
   251	
   252			if (btn_changes_occured)
   253				process_button_events(pdata, input_dev);
   254	
   255			pdata->scan_phase = pdata->phase_state.phase_start;
   256		} else {
   257			uint8_t *btn_keylines;
   258			uint8_t number_of_buttons_pressed = 0;
   259			uint8_t btn_index;
   260			uint8_t btn_key;
   261			uint16_t index;
   262			int i;
   263	
   264			btn_keylines = kcalloc(pdata->num_line_gpios, sizeof(uint8_t),
   265					       GFP_KERNEL);
   266			for (i = 0; i < pdata->num_line_gpios; i++) {
   267				index = (pdata->scan_phase * pdata->num_line_gpios) + i;
   268				btn_key = pdata->button_matrix[index];
   269				btn_keylines[i] = false;
   270	
   271				if ((btn_key != pdata->button_matrix[0]) &&
   272				    (get_gpio_line_value(pdata, (int)i) != false)) {
   273					btn_keylines[i] = true;
   274					number_of_buttons_pressed++;
   275				}
   276			}
   277			if (number_of_buttons_pressed < 2) {
   278				for (i = 0; i < pdata->num_line_gpios; i++) {
   279					index = (pdata->scan_phase *
   280						 pdata->num_line_gpios) +
   281						i;
   282					btn_key = pdata->button_matrix[index];
   283					if (btn_key != pdata->button_matrix[0]) {
   284						btn_index =
   285							get_btn_index(pdata, btn_key);
   286						set_btn_state_by_hw(
   287							&pdata->button_array[btn_index],
   288							btn_keylines[i]);
   289					}
   290				}
   291			}
   292	
   293			kfree(btn_keylines);
   294			activate_line_driving(pdata, (int)pdata->scan_phase, false);
   295			pdata->scan_phase++;
   296			activate_line_driving(
   297				pdata, (int)(pdata->scan_phase % pdata->num_line_gpios),
   298				true);
   299		}
   300	}
   301	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
